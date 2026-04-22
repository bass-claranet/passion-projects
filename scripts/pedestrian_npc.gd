extends CharacterBody2D

@export var speed := 40
@export var stop_mark: Marker2D
@export var stop_time := 3.0
@export var colors : Array[SpriteFrames]
@onready var sprite = $AnimatedSprite2D
var stop_marks = []
var stopped_points : Array = []
var path : PathFollow2D
var triggered := false
var stopped := false
var has_stopped := false
var stop_timer := 0.0
 
func _ready():
	if colors.size() > 0:
		$AnimatedSprite2D.sprite_frames = colors.pick_random()
		sprite.play("walk")
func _physics_process(delta):
	if not path or not triggered:
		return
	if stopped:
		sprite.play("idle")
		stop_timer -= delta
		if stop_timer <= 0:
			stopped = false
		return
	else:
		sprite.play("walk")
	path.progress += speed * delta
	for points in stop_marks:
		if points and not stopped_points.has(points):
				if global_position.distance_to(points.global_position) < 10:
					stopped = true
					stop_timer = stop_time
					stopped_points.append(points)
					break
