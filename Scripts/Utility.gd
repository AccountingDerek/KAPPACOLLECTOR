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
signal hover(task: String)
var hovering: bool = false

func _ready():
	load_checklist()
	update.connect(save_checklist)
	reset.connect(save_checklist)

func save():
	var save_dict:= SaveData.TaskCompletion
	return save_dict

func save_checklist():
	if not FileAccess.file_exists("user://checklist.tres"):
		FileAccess.open("user://checklist.tres", FileAccess.WRITE_READ)
	var save_dict:= Save.new()
	save_dict.save_dict = SaveData.TaskCompletion
	ResourceSaver.save(save_dict, "user://checklist.tres", ResourceSaver.FLAG_NONE)

func load_checklist():
	if not FileAccess.file_exists("user://checklist.tres"):
		return
	var save_dict:= Save.new()
	save_dict = ResourceLoader.load("user://checklist.tres")
	SaveData.TaskCompletion = save_dict.save_dict

func find_id(id: String) -> TaskResource:
	for i in TaskData.reference_list:
		if i == id:
			return TaskData.reference_list[i]
	return null
