extends Node2D


const DUDE_2 = preload("res://characters/dude_2.tscn")

func _ready():
	await get_tree().create_timer(2).timeout
	spawn()

func spawn():
	var inst = DUDE_2.instantiate()
	add_child(inst)
	inst.get_node("StateMachine").perform_action("Walk",{"direction":1})
