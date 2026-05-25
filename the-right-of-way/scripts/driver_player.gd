extends CharacterBody2D

signal touched_sidewalk(is_on_sidewalk: bool)
@export var move_speed : float = 100	
@export var rotation_speed : float = TAU * 2
@export var max_speed := 200.0
@export var acceleration := 100.0
@export var brake := 600.0
@export var turn_slowdown := 4
@export var tilemap: TileMapLayer
@export var colors: Array[Texture2D]
@onready var label = $WarningLabel

func _ready():
	if colors.size() > 0:
		$Sprite2D.texture = colors.pick_random()

func _physics_process(delta : float):
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	).normalized()
	if input_direction != Vector2.ZERO:
		var turn_amount = velocity.normalized().dot(input_direction)
		var turn_penalty = clamp(1.0 - turn_amount, 0.0, 1.0)
		velocity *= 1.0 - (turn_penalty * turn_slowdown * delta)
	velocity = velocity.move_toward(input_direction * max_speed, acceleration * delta)
	if Input.is_action_pressed("space"):
		velocity = velocity.move_toward(Vector2.ZERO, brake * delta)
	if velocity.length() > 5:
		var target_angle = velocity.angle() + PI/2
		rotation = lerp_angle(rotation, target_angle, rotation_speed * delta)	
	var cell = tilemap.local_to_map(tilemap.to_local(global_position))
	var tile_data = tilemap.get_cell_tile_data(cell)
	var on_the_sidewalk = tile_data and tile_data.get_custom_data("is_sidewalk")
	label.visible = on_the_sidewalk
	touched_sidewalk.emit(on_the_sidewalk)
	label.global_rotation = 0
	move_and_slide()
