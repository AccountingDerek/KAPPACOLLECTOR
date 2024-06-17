extends Control
@onready var hover = $Hover
@onready var click = $Click
@export var settings: bool = false

func _ready() -> void:
	Settings.apply_settings.connect(apply_settings)
	apply_settings()

func _on_exit_pressed():
	click.play()
	if settings:
		Utility.window.emit()
	else:
		OS.kill(OS.get_process_id())


func _on_minimize_pressed():
	click.play()
	get_tree().root.mode = Window.MODE_MINIMIZED


func button_hover():
	hover.play()

func apply_settings():
	hover.set_volume_db((Settings.volume/2)-50)
	click.set_volume_db((Settings.volume/2)-50)
