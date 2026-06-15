extends CharacterBody2D

var speed = 120
var control_player = true
var player_state

@onready var camera = $Camera2D

func _physics_process(_delta):

	var direction = Input.get_vector("left", "right", "up", "down")
	if control_player:	
		if direction.x == 0 and direction.y == 0:
			player_state = "idle"
		elif direction.x != 0 or direction.y != 0:
			player_state = "walking"
		
		velocity = direction * speed
		move_and_slide()
		
		play_anim(direction)

func play_anim(dir):
	speed = 150
	if player_state == "idle":
			$AnimatedSprite2D.play("front_idle")
	if player_state == "walking":
		if dir.y == -1:
			$AnimatedSprite2D.play("back")
		if dir.x == 1:
			$AnimatedSprite2D.play("right")
		if dir.y == 1:
			$AnimatedSprite2D.play("front")
		if dir.x == -1:
			$AnimatedSprite2D.play("left")
			
func player():
	pass
