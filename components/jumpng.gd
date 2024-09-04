extends StateComponent

# Called when the node enters the scene tree for the first time.
func perform(vars):
	owner.get_node("moveable").jump()

