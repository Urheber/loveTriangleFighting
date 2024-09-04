# kick is probably a simplest attack object.
# attack object interacts with defence object
# attack object is initiated by attack subsistem at a certain position
# it ends after communication with defence
# defence objects check for intersection with attack objects. 
# If attack object is active, defence object calls perform, evaluates result
# then it calls result methon of attack to change attack's state

class_name AttackObject extends Area2D

@onready var attack = $".."
var miss_chance:float = 0.2
var power:float = 1
var is_active:bool = false

var counterpart:Defence

func set_counterpart(c):
	counterpart = c

func perform():
	is_active = true
	attack.animations.play("kick")
	await get_tree().create_timer(1).timeout
	if counterpart != null:
		counterpart.perform(self)
	stop()

func stop():
	is_active = false
	attack.animations.play("idle")

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass
