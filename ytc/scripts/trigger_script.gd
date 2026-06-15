extends Area2D
@onready var linus: CharacterBody2D = $"../Linus"
# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.Styles.load_style("default_style")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_body_entered(_body) -> void:
	var gui = linus.get_node("GUI")
	var meter = linus.get_node("TemperMeter")
	gui.hide()
	meter.hide()
	linus.control_player = false
	await get_tree().create_timer(1.5).timeout
	Dialogic.start_timeline("argument")
