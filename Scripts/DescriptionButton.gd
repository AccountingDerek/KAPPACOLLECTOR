extends Button

var data: TaskResource
var id: Tasks.tasks
var displayed_text: String
var post: String = ""
var override: bool = false
var trader: Tasks.traders

func _ready() -> void:
	%Hover.set_volume_db((Settings.volume/2)-50)
	if data.post_choice and not override:
		post = "OR"
	text = "• " + displayed_text + " " + post

func _on_pressed():
	Utility.click.emit()
	Utility.hover.emit(id)
	Utility.screen_switch.emit(trader)

func _on_mouse_entered():
	%Hover.play()
