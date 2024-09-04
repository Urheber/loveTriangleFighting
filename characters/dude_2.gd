extends CharacterBody2D

enum triggerTypes {END ,ACTION_RELEASED, ACTION_PRESSED, AREA_ENTERED}
const CONFIG = {
	"actions":{
		"Idle":{
			"init":{
				"left":["Walk",{"direction":-1}],
				"right":["Walk",{"direction":1}],
				"attack":"Kick",
				"jump":"Jump"
			}
		},
		"Block":{
			"on_end":"Idle",
			"parameters":{
				"power":1.0
			}
		},
		"Hit":{
			"on_end":"Idle"
		}
	},
	"out_state":"Out",
	"initial_state":"Idle",
	"health":3.0,
}


# example1
# strategy config -- what is performed by entity
# wait till something attacks and block it if it attacks from front
# go random direction if collide start blocking/hitting 
# stay and if anticipate attack perform block with some probability
