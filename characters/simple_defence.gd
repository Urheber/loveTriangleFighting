extends Node2D
@onready var defence = $"../defence"
@onready var parent = $".."
@onready var moveable = $"../moveable"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func feel_attacker(attack_object):
	var angle_to_attacker = rad_to_deg(
			Vector2(defence.direction,0).angle_to(attack_object.position - parent.position)
		)
	print("feel attacker at {}, angle {}".format(attack_object.position, angle_to_attacker))
	if (angle_to_attacker>90 and randf()<0.8):
		defence.perform()
	if (angle_to_attacker<90 and randf()<0.2):
		moveable.change_direction()
		defence.perform()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
