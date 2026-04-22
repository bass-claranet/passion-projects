extends Node2D

@export var tilemap: TileMapLayer
@onready var CharPath : String

func _ready():
	CharPath = GlobalData.CharPath
	var playerNode = load(CharPath).instantiate()
	add_child(playerNode)
	var camera = playerNode.get_node("Camera2D") as Camera2D
	camera.make_current()
	playerNode.tilemap = $TileMapLayer/Map
	if CharPath.contains("driver"):
		playerNode.global_position = $driverSpawn.global_position
	else:
		playerNode.global_position = $pedestrianSpawn.global_position	
	var arrow = $UI/Guide
	arrow.player = playerNode
	arrow.target = $WinArea
