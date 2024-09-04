extends StateComponent
@onready var moveable = owner.get_node("moveable")
@onready var direction = owner.get_node("direction")
# Called when the node enters the scene tree for the first time.
var active = 0
func perform(vars):
	if vars["direction"] != direction.direction:
		direction.change_direction()
	active = 1
	moveable.go()

func stop():
	var moveable = owner.get_node("moveable")
	active = 0
	moveable.stop()

func _physics_process(delta):
	if active:
		moveable.go()
