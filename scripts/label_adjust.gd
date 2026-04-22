extends Label

func _ready():
	var screen_size = get_viewport_rect().size
	position = screen_size - Vector2(160, 40)
	scale = Vector2(2,2)
