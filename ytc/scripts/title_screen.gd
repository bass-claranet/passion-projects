extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_start_pressed():
	$CanvasModulate/AnimationPlayer.play("opacity")
	await $CanvasModulate/AnimationPlayer.animation_finished
	get_tree().change_scene_to_file("res://scenes/prologue.tscn")

func _on_about_pressed():
	pass

func _on_exit_pressed():
	get_tree().quit()
	print("Exit pressed")

func _on_instructions_toggled(toggled_on: bool):
	if toggled_on:
		$CanvasLayer.show()
	else:
		$CanvasLayer.hide()
