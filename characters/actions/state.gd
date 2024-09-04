class_name State extends Node2D


signal finished(me:State)

func stop():
	owner.get_node("Animations").stop()
	stopChildren()
	finished.emit(self)

func stopChildren():
	for c in get_children():
		if c is StateComponent and c.has_method("stop"):
			c.stop()

func performChildren(vars):
	for c in get_children():
		if c is StateComponent and c.has_method("perform"):
			c.perform(vars)

func perform(vars):
	owner.get_node("Animations").play(name)
	performChildren(vars)
	await owner.get_node("Animations").animation_finished
	finished.emit(self)

func _physics_process(delta):
	for c in get_children():
		if c is StateComponent and c.has_method("_physics_process"):
			c._physics_process(delta)
