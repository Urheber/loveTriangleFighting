extends StateComponent

@export var init_action:String
@export var init_vars:Dictionary

@export var ends_by_release:bool = false

func _physics_process(delta):
	if Input.is_action_just_pressed(init_action):
		get_parent().perform(init_vars)
	if ends_by_release and Input.is_action_just_released(init_action):
		get_parent().stop()
