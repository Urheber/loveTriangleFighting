class_name DefenceObject extends Node2D

var health:float = 1;
var is_active:bool = false

func activate():
	is_active = true
	
func stop():
	is_active = false

# probably there should be "core defence" that depletes health
# called when active attack object interacts with active defence object
# defence has health that can be depleted with attacks
# after resulting calculation defence object emits signal with result
# some supervising object has to use that result to
#  - play interaction animation on collision (4 example @miss @dodge)
#  - generate win-lose situation
#  - update ui elements like health bars
func perform(attack_object:AttackObject):
	var a0 := attack_object.power;
	var d0 := health;
	if health>attack_object.power:
		health -= attack_object.power
		attack_object.stop()
	else:
		stop()
		attack_object.power -= health
	# print results
	print("block. Results: defence {}->{} | attack {}->{}", d0, health, a0, attack_object.power)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
