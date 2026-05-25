extends Control

@onready var checkbox = $Collapse/Checklist/CheckBox
@onready var stop_checkbox = $Collapse/Checklist/CheckBox2
var checklists: Array[CheckBox]
var road := false

func _ready():
	checklists = [checkbox, stop_checkbox]
	for checks in checklists:
		checks.toggled.connect(_check_safety)
	_check_safety(false)
	var players = get_tree().get_nodes_in_group("player")
	for player in players:
		if player.has_signal("touched_road"):
			player.touched_road.connect(_on_road_touched)
			break
func _on_road_touched(on_road: bool):
	if road:
		return	
	if on_road:
		checkbox.button_pressed = false
		road = true
func _check_safety(_pressed: bool):
	var all_clear = true
	for checks in checklists:
		if not checks.button_pressed:
			all_clear = false
			break
	if all_clear:
		NoSafety.safety()
	else:
		NoSafety.safety_warning()
