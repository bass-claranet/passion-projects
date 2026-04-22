extends Node


signal area_hit(area_type)
var last_hit = ""
func emit_area_hit(type):
	last_hit = type
	area_hit.emit(type)
