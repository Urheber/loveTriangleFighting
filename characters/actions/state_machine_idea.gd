extends Node


func define():
	idle = state("Idle")
	idle.goto(
		func():return Input.is_action_just_pressed("left"),
		"Walk",
		{"direction":1}
	)
	idle.goto(
		dwell(2).random(.5), # wait 4 2 secs, if p<.5 go to walk
		"Walk",
		{
			"direction":random([1,-1],[.5,.5]),
			"duration":randf([1,3])
		}
	)
