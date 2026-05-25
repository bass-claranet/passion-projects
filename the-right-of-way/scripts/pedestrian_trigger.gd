extends Area2D

@export var scene: PackedScene
var stepped := false
func _ready():
	add_to_group("player")
func _on_pedestrian_trigger_body_entered(body: Node2D):	
	if body.is_in_group("player") and not stepped:
		stepped = true
		call_deferred("spawn_pedestrian")
		print("spawned")
func spawn_pedestrian():
	for path2d in get_children():
		if path2d is Path2D:
			var stops := []
			var pedestrian_npc = scene.instantiate()
			var path = PathFollow2D.new()
			path.progress = 0
			path.rotates = true
			path.loop = true
			path2d.add_child(path)
			path.add_child(pedestrian_npc)
			pedestrian_npc.path = path	
			pedestrian_npc.triggered = true
			for child in path2d.get_children():
				if child is Marker2D and child.name.begins_with("StopSignPoint"):
					stops.append(child)
			pedestrian_npc.stop_marks = stops
