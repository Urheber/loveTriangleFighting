class_name Walk extends State

# Called when the node enters the scene tree for the first time.
func perform(vars):
	super(vars)
	if vars.has("direction") and vars["direction"] != owner.direction.direction:
		owner.direction.change_direction()
	owner.get_node("moveable").go()
	if vars.has("duration"):
		await get_tree().create_timer(vars["duretion"]).timeout
		stop()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
