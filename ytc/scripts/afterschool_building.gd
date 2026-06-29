extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasModulate.color = Color(0, 0, 0, 1)
	$CanvasModulate/AnimationPlayer.play("fade_in")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
