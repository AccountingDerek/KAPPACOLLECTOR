extends ColorRect

var following = false
var dragging_start_position = Vector2()



func _on_gui_input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == 1:
			following = !following
			dragging_start_position = get_local_mouse_position()

func _process(_delta):
	if following:
		#DisplayServer.window_set_position(DisplayServer.window_get_position + get_global_mouse_position() - dragging_start_position)
		get_window().position = get_window().position + Vector2i(get_global_mouse_position()) - Vector2i(dragging_start_position)
