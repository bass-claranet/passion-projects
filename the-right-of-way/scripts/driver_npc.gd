extends CharacterBody2D

@export var speed := 90
@export var stop_time := 3.0
@export var colors: Array[Texture2D]
var stop_marks = []
var stopped_points : Array = []
var path : PathFollow2D
var triggered := false
var stopped := false
var stop_timer := 0.0
func _ready():
	if colors.size() > 0:
		$Sprite2D.texture = colors.pick_random()
	$Sprite2D.rotation = deg_to_rad(90)
func _physics_process(delta):
	if not path or not triggered:
		return
	if stopped:
		stop_timer -= delta
		if stop_timer <= 0:
			stopped = false
		return
	path.progress += speed * delta
	for points in stop_marks:
		if points and not stopped_points.has(points):
				if global_position.distance_to(points.global_position) < 10:
					stopped = true
					stop_timer = stop_time
					stopped_points.append(points)
					break
