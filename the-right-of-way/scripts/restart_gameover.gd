extends Button

func _on_restart_pressed():
	get_tree().change_scene_to_file("res://scenes/gameplay.tscn")
func _on_change_player_pressed():
	get_tree().change_scene_to_file("res://scenes/drive_or_walk.tscn")
