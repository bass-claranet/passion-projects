extends Area2D

func _on_body_entered(body: Node2D):
	if body.is_in_group("building_trigger"):
		PlayerCollideWithNpc.emit_area_hit("building")
		call_deferred("_game_over")
	elif body.is_in_group("pedestrian_trigger"):
		PlayerCollideWithNpc.emit_area_hit("pedestrian")
		call_deferred("_game_over")
	elif body.is_in_group("driver_trigger"):
		PlayerCollideWithNpc.emit_area_hit("driver")
		call_deferred("_game_over")
func _on_area_entered(area):
	if area.is_in_group("win_scene"):
		PlayerCollideWithNpc.emit_area_hit("driver_win")
		call_deferred("_you_win")
func _game_over():
	get_tree().change_scene_to_file("res://scenes/game_over_newspaper.tscn")	
func _you_win():
	get_tree().change_scene_to_file("res://scenes/you_win_scene.tscn")
