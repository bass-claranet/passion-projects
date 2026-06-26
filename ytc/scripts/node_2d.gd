extends Node2D
@onready var linus: CharacterBody2D = $Linus
@onready var eliza: CharacterBody2D = $Eliza
@onready var gui = linus.get_node("GUI")
@onready var meter = linus.get_node("TemperMeter")
@onready var camera = linus.get_node("Camera2D")
var has_triggered_event: bool = false

# Called when the node enters the scene tree for the first time.

func _ready():
	$Eliza.control_player = false
	$CanvasModulate.color = Color(0, 0, 0, 1)
	$CanvasModulate/AnimationPlayer.play("fade_in")
	Dialogic.Styles.load_style("default_style")
	if has_triggered_event == false:
		gui.hide()
		meter.hide()
		linus.control_player = false
		$ScenePlayer.play("argument_scene")
		await get_tree().create_timer(1.5).timeout
		Dialogic.start("argument")
		Dialogic.timeline_ended.connect(_on_timeline_ended)
		has_triggered_event = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	pass

func _on_timeline_ended():
	gui.show()
	meter.show()
	linus.control_player = true
	$ScenePlayer.play("argument_scene_end")
	await get_tree().create_timer(4).timeout
