extends Area2D
@onready var linus: CharacterBody2D = $"../Linus"
@onready var gui = linus.get_node("GUI")
@onready var meter = linus.get_node("TemperMeter")
@onready var camera = linus.get_node("Camera2D")
var has_triggered_event: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_body_entered(_body) -> void:
	if has_triggered_event == false:
		gui.hide()
		meter.hide()
		linus.control_player = false
		await get_tree().create_timer(1.5).timeout
		Dialogic.start("argument")
		Dialogic.timeline_ended.connect(_on_timeline_ended)
		has_triggered_event = true
	else:
		return
	
func _on_timeline_ended():
	gui.show()
	meter.show()
	linus.control_player = true
