extends CharacterBody2D

signal touched_road(is_on_road: bool)
@export var move_speed : float = 40
@export var run_speed : float = 100
@export var rotation_speed : float = TAU * 2
@export var starting_direction : Vector2 = Vector2(0,1)
@export var colors : Array[SpriteFrames]
@export var tilemap: TileMapLayer
@onready var label = $WarningLabel
@onready var sprite = $AnimatedSprite2D
var direction : Vector2

func _ready():
	if colors.size() > 0:
		$AnimatedSprite2D.sprite_frames = colors.pick_random()
func _physics_process(_delta: float):
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	).normalized()
	var speed = move_speed
	var move = input_direction != Vector2.ZERO
	if move:
		if Input.is_action_pressed("space"):
			speed = run_speed
			sprite.play("run")
		else:
			sprite.play("walk")
	else:
		sprite.play("idle")	
	if move:
		var process_direction = input_direction.normalized()
		var target_angle = process_direction.angle() + PI/2  
		rotation = lerp_angle(rotation, target_angle, rotation_speed * _delta)
	var cell = tilemap.local_to_map(tilemap.to_local(global_position))
	var tile_data = tilemap.get_cell_tile_data(cell)
	var on_the_road = tile_data and tile_data.get_custom_data("is_road")
	label.visible = on_the_road
	touched_road.emit(on_the_road)
	label.global_rotation = 0
	velocity = input_direction * speed
	move_and_slide()
