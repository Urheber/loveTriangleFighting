class_name StateMachine extends Node
@onready var direction = $"../direction"

@export var initial_state = "Idle"
@export var end_connections: = [
	["Walk", "Idle"],
	["Jump", "Idle"],
	["Kick", "Idle"],
	["Hit", "Idle"]
]

@export var action_init = {
	"right": "Walk",
	"left": "Walk",
	"jump": "Jump",
	"attack": "Kick"
}

var current_state
@export var out_state = "Out"

func perform_action(n, args = {}):
	current_state = get_node(n)
	current_state.perform(args)

@onready var config = owner.CONFIG

func user_initiated_actions():
	var current_state_config = config["actions"][current_state.name]
	if current_state_config.has("init"):
		var action_init = current_state_config["init"]
		for k in current_state_config["init"]:
			if Input.is_action_just_pressed(k):
				perform_action(action_init[k][0], action_init[k][1])


func _ready2():
	for a in config["actions"]:
		var a_data = config["actions"][a]
		if a_data.has_key("on_end"):
			get_node(a).finished.connect(_on_finished)
	if config["actions"].has_key("out_state"):
		out_state = config["actions"].has_key("out_state")
		get_node(out_state).finished.connect(_on_out_finished)
	perform_action(config["initial_state"])

# Called when the node enters the scene tree for the first time.
func _ready():
	for c in end_connections:
		get_node(c[0]).finished.connect(_on_finished)
	if has_node(out_state):
		get_node(out_state).finished.connect(_on_out_finished)
	perform_action(initial_state)

func _on_finished(name):
	var end_connection = end_connections.filter(func(x):return x[0]==name)
	if end_connection.size()>0:
		perform_action(end_connection[0][1])

func _on_out_finished(name):
	owner.queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if (Input.is_action_just_pressed("right") and direction.direction == -1) or (
		Input.is_action_just_pressed("left") and direction.direction == 1):
		direction.change_direction()
	for k in action_init:
		if Input.is_action_just_pressed(k):
			perform_action(action_init[k])

