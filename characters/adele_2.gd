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
		"Kick":{
			"on_end":"Idle",
			"parameters":{
				"power":1.0
			}
		},
		"Jump":{
			"on_end":"Idle"
		},
		"Hit":{
			"on_end":"Idle"
		},
		"Walk":{
			"on_end":"Idle",
			"player_stop":[[triggerTypes.ACTION_RELEASED, "left"], [triggerTypes.ACTION_RELEASED, "right"]],
			"parameters":{
				"speed":300.0
			}
		}
	},
	"initial_state":"Idle",
	"health":10.0
}
