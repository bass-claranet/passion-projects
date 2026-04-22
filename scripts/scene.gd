extends TextureRect
	
func _ready():
	var type = PlayerCollideWithNpc.last_hit
	if type == "pedestrian":
		texture = load("res://assets/driver_pedestrian.png")
	elif type == "building":
		texture = load("res://assets/driver_building.png")
	elif type == "driver":
		texture = load("res://assets/driver_crash.png")
	elif type == "driver_win":
		texture = load("res://assets/driver_win.png")
	elif type == "pedestrian_win":
		texture = load("res://assets/pedestrian_win.png")
