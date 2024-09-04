extends AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	animation_finished.connect(_on_animation_finished)

func _on_animation_finished(name:String):
	print("animation finished: %s | %s"%[owner.name, name])


