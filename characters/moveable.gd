extends Node2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var parent = $".."
@onready var animations = $"../AnimatedSprite2D"
@onready var direction = $"../direction"

#@export var direction = 1;


	
func go(_direction):
	if direction.direction!=_direction:
		direction.change_direction()
	parent.velocity.x = direction.direction * SPEED
	animations.play("walk")
	
func stop():
	parent.velocity.x = 0
	animations.play("idle")
	
func jump():
	parent.velocity.y = JUMP_VELOCITY
	animations.play("jump")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if not parent.is_on_floor():
		parent.velocity.y += gravity * delta
	parent.move_and_slide()
