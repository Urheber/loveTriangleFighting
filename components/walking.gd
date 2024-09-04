extends StateComponent

# Called when the node enters the scene tree for the first time.
func perform(vars):
	var direction = owner.get_node("direction")
	var moveable = owner.get_node("moveable")
	if vars["direction"] != direction.direction:
		direction.change_direction()
	moveable.go()

func stop():
	var moveable = owner.get_node("moveable")
	moveable.stop()
