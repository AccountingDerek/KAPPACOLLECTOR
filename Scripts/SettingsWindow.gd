extends Window

func _ready() -> void:
	Utility.window.connect(toggle_visible)
	
func toggle_visible():
	visible = not visible

func reset_button():
	SaveData.reset()
