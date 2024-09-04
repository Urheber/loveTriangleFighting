extends StateComponent

signal message(msg:String, payload:Dictionary)

func perform(vars):
	await owner.get_node("Animations").animation_finished
	owner.queue_free()
