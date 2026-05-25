extends Control

@onready var road_checkbox = $Collapse/Checklist/CheckBox
@onready var stop_checkbox = $Collapse/Checklist/CheckBox2
@onready var ped_checkbox = $Collapse/Checklist/CheckBox3
var checklists: Array[CheckBox]
var sidewalk := false

func _ready():
	checklists = [road_checkbox, stop_checkbox, ped_checkbox]
	for checks in checklists:
		checks.toggled.connect(_check_safety)
	_check_safety(false)
	add_to_group("instructions")
	var players = get_tree().get_nodes_in_group("player")	
	for player in players:
		if player.has_signal("touched_sidewalk"):
			player.touched_sidewalk.connect(_on_sidewalk_touched)
			break
func _on_sidewalk_touched(on_sidewalk: bool):
	if sidewalk:
		return
	if on_sidewalk:
		road_checkbox.button_pressed = false
		sidewalk = true
func on_stop_sign():
	stop_checkbox.button_pressed = false
	ped_checkbox.button_pressed = false
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
