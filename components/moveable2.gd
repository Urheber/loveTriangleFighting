extends Node2D

const SPEED = 400.0
const JUMP_VELOCITY = -600.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var direction = $"../direction"

#@export var direction = 1;


func change_direction():
	direction.change_direction()

func go():
	owner.velocity.x = direction.direction * SPEED
	
func stop():
	owner.velocity.x = 0
	
func jump():
	owner.velocity.y = JUMP_VELOCITY

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if not owner.is_on_floor():
		owner.velocity.y += gravity * delta
	owner.move_and_slide()
