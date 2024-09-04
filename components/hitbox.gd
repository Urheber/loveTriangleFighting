class_name HitBox extends Area2D

signal message(msg:String, payload:Dictionary)

@export var health := 3.0 

func _ready():
	add_to_group("DataProviders")
	connect("area_entered", _on_area_entered)
	
func _on_area_entered(body:AttackBox):
	if body!=null:
		health -= body.power
		print("attack %.1f -> %.1f"%[body.power, health])
		if owner.has_node("StateMachine"):
			var sm = owner.get_node("StateMachine")
			if health<=0:
				message.emit("Redirect", {"name":"Out"})
			else:
				message.emit("Redirect", {"name":"Hit"})
				message.emit("ChangeData", {"type":"Hit", "new_health":health, "power":body.power})
