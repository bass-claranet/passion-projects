extends Control

@onready var label = $NotSafe
func _ready():
	NoSafety.connect("no_safety", Callable(self, "_on_safety"))
	_on_safety()
func _on_safety():
	label.visible = not NoSafety.all_checked
