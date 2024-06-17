extends Button

var data: TaskResource
var id: Tasks.tasks
var displayed_text: String
var post: String = ""
var override: bool = false
var trader: Tasks.traders
var complete: bool
var check: String = ""

func _ready() -> void:
	if data.post_choice and not override:
		post = " OR"
	if complete: 
		check = " ✓"
	text = "• " + displayed_text + check + post

func _on_pressed():
	Utility.click_sound.emit()
	Utility.hover.emit(id)
	Utility.screen_switch.emit(trader)

func _on_mouse_entered():
	Utility.hover_sound.emit()
