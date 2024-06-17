extends Control
@export var settings: bool = false

func _on_exit_pressed():
	Utility.click_sound.emit()
	if settings:
		Utility.window.emit()
	else:
		OS.kill(OS.get_process_id())


func _on_minimize_pressed():
	Utility.click_sound.emit()
	get_tree().root.mode = Window.MODE_MINIMIZED


func button_hover():
	Utility.hover_sound.emit()
