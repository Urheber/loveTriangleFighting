class_name StateMachine extends Node2D

@export var initial_state = "Idle"

var current_state

func perform_action(n, args = {}):
	current_state = get_node(n)
	current_state.perform(args) 

func _ready():
	perform_action(initial_state)
	for c in get_children():
		c.finished.connect(_on_finished)
		for c2 in c.get_children():
			if c2.has_signal("message"):
				c2.message.connect(_on_message)

func _on_finished(finished):
	if finished.has_node("ends_to"):
		var nextEventName = finished.get_node("ends_to").state
		perform_action(nextEventName)

func _on_message(msg:String, payload:Dictionary):
	if msg=="Redirect":
		perform_action(payload["name"])
