extends Area2D
@export var stop_time := 0.5
@export var stop_required := 2.0
var player_in := false
var stopped := false
var timer := 0.0
var player
var did_not_wait := false

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
func _on_body_entered(body):
	if body.is_in_group("player"):
		player_in = true
		player = body
		timer = 0.0
		stopped = false
		did_not_wait = false
func _on_body_exited(body):
	if body == player:
		if not stopped and not did_not_wait:
			get_tree().call_group("instructions", "on_stop_sign")
			did_not_wait = true
		player_in = false
		player = null
		timer = 0.0
		stopped = false		
func _process(delta):
	if not player_in or player == null:
		return
	timer += delta
	var speed = player.velocity.length()
	if speed < stop_required:
		stopped = true
	if timer >= stop_time and not stopped and not did_not_wait:
		get_tree().call_group("instructions", "on_stop_sign")
		did_not_wait = true
