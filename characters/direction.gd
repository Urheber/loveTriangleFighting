extends Node
signal direction_changed()
@export var direction = 1;

func change_direction():
	direction *= -1
	direction_changed.emit()

var directional_nodes := []
func get_directional(n) -> Array:
	for c in n.get_children():
		if c is Directional:
			directional_nodes.append(c)
		if c.get_child_count()>0:
			get_directional(c)
	return directional_nodes
			

func _ready():
	get_directional(get_parent())
	for s in directional_nodes:
		direction_changed.connect(s.on_direction_changed)
			
