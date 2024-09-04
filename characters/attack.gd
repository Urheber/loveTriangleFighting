extends Node2D
signal attack(attack_object)
@onready var animations = $"../AnimatedSprite2D"

#attack_object used to perform attacks
var attack_object 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func perform():
	print("attack!")
	$kick.perform()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
