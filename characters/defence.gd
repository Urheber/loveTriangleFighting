class_name Defence extends Area2D

var direction:int = 1; # direction of defence
var defence_objects = [];
@export var health = 5;  
signal fight_event(defence,attack)
@onready var animations = $"../AnimatedSprite2D"


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("defences")
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	for c in get_children():
		if c is DefenceObject:
			defence_objects.append(c)


func _on_body_entered(body):
	if body is AttackObject:
		body.set_counterpart(self)

func _on_body_exited(body):
	if body is AttackObject and body.counterpart == self:
		body.counterpart = null

func perform(attack_object):
	for c in defence_objects:
		if c.is_active and attack_object.is_active:
			c.perform(attack_object)
	if attack_object.is_active:
		health -= attack_object.power
		attack_object.stop()
		fight_event.emit(self, attack_object)
		animations.play('hit')
		
