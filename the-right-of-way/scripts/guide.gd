extends TextureRect

@export var player: Node2D
@export var target: Node2D
	
func _ready():
	var screen_size = get_viewport_rect().size
	position = screen_size - Vector2(120, 120)
	scale = Vector2(2,2)
func _process(_delta) -> void:
	if player and target:
		var direction = target.global_position - player.global_position
		rotation = direction.angle() + deg_to_rad(90)
