extends Area2D

func _on_body_entered(body: Node2D):
	if body.is_in_group("driver_trigger"):
		PlayerCollideWithNpc.emit_area_hit("pedestrian")
		call_deferred("_game_over")
func _on_area_entered(area):
	if area.is_in_group("win_scene"):
		PlayerCollideWithNpc.emit_area_hit("pedestrian_win")
		call_deferred("_you_win")
func _game_over():
	get_tree().change_scene_to_file("res://scenes/game_over_newspaper.tscn")
func _you_win():
	get_tree().change_scene_to_file("res://scenes/you_win_scene.tscn")
