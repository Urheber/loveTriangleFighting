extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	for d:Defence in get_tree().get_nodes_in_group("defences"):
		d.fight_event.connect(_on_fight)

func _on_fight(defence:Defence, attack:AttackObject):
	print("fight has happened: defence %.1f, attack %.1f"%[
		defence.health,
		attack.power])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
