extends Node

var secret_string = ""
signal secret(secret: String)
signal screen_switch(trader: Tasks.traders)
signal click_sound
signal hover_sound
signal complete_sound
signal update
signal completion
signal reset
signal window
signal hover(task: Tasks.tasks)
var hovering: bool = false

func _ready():
	load_checklist()
	update.connect(save_checklist)
	reset.connect(save_checklist)

func save():
	var save_dict:= SaveData.TaskCompletion
	return save_dict

func save_checklist():
	var save_list = FileAccess.open("user://checklist.timmy", FileAccess.WRITE)
	var save_data = save()
	var json_string = JSON.stringify(save_data)
	save_list.store_line(json_string)

func load_checklist():
	if not FileAccess.file_exists("user://checklist.timmy"):
		return
	
	var save_list = FileAccess.open("user://checklist.timmy", FileAccess.READ)
	while save_list.get_position() < save_list.get_length():
		var json_string = save_list.get_line()
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue
		var data = json.get_data()
		var loaded_data:= {}
		for i in data.keys():
			loaded_data[int(i)] = data[i]
		SaveData.TaskCompletion = loaded_data
