class_name Directional extends Node

@onready var parent = $".."
@export var type := "float"
@export var property_name := ""

func on_direction_changed():
	if type == 'bool':
		parent.set(property_name, not parent.get(property_name))
	if type == 'float':
		parent.set(property_name, -parent.get(property_name))
	if type == 'x':
		var v:Vector2 = parent.get(property_name)
		parent.set(property_name, Vector2(-v.x, v.y))
