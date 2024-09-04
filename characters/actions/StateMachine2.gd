extends Node

@export var initial_state = "Idle"

var current_state

func perform_action(n, args = {}):
	current_state = get_node(n)
	current_state.perform(args) 

func _ready():
	perform_action(initial_state)
	for c in get_children():
		c.finished.connect(_on_finished)

func _on_finished(finished):
	if finished.has_node("ends_to"):
		var nextEventName = finished.get_node("ends_to").state
		perform_action(nextEventName)
