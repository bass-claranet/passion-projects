extends Node

signal no_safety
var all_checked := false

func safety_warning():
	all_checked = false
	emit_signal("no_safety")
	
func safety():
	all_checked = true
	emit_signal("no_safety")
