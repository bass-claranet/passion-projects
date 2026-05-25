extends Node2D
@export var driver_spawn : Marker2D
@export var pedestrian_spawn : Marker2D
func _ready():
	if not GlobalData.CharPath:
		return
	var gameplay_scene = load(GlobalData.CharPath)
	var player = gameplay_scene.instantiate()
	if GlobalData.CharPath.contains("driver"):
		player.global_position = driver_spawn.global_position
	else:
		player.global_position = pedestrian_spawn.global_position
