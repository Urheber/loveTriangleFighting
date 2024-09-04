extends Node2D

@onready var moveable = $"../moveable"
@onready var attack = $"../attack"
@onready var defence = $"../defence"

var direction

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_just_pressed("right"):
		moveable.go(1)
	if Input.is_action_just_released("right"):
		moveable.stop()
	if Input.is_action_just_released("left"):
		moveable.stop()
	if Input.is_action_pressed("left"):
		moveable.go(-1)
	if Input.is_action_just_pressed("jump"):
		moveable.jump()
	if Input.is_action_just_pressed("attack"):
		attack.perform()
	if Input.is_action_just_pressed("block"):
		defence.perform()
	
