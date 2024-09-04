extends Node

@export var direction = 1;

func change_direction():
	direction*=-1;
	owner.scale.x = -owner.scale.x
