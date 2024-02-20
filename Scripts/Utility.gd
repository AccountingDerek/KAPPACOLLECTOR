extends Node

signal screen_switch
signal update
signal completion
signal hover(task: Tasks.tasks)
var hovering: bool = false

func _ready():
	load_checklist()
	update.connect(save_checklist)

func special_case(task: Tasks.tasks) -> bool:
	match task:
		Tasks.tasks.BigCustomer:
			if SaveData.TaskCompletion[Tasks.tasks.Chem4] or SaveData.TaskCompletion[Tasks.tasks.Curiosity]:
				return true
		Tasks.tasks.Chem4:
			if SaveData.TaskCompletion[Tasks.tasks.BigCustomer] or SaveData.TaskCompletion[Tasks.tasks.Curiosity]:
				return true
		Tasks.tasks.Curiosity:
			if SaveData.TaskCompletion[Tasks.tasks.Chem4] or SaveData.TaskCompletion[Tasks.tasks.BigCustomer]:
				return true
		Tasks.tasks.SafeCorridor:
			if SaveData.TaskCompletion[Tasks.tasks.BigCustomer] or SaveData.TaskCompletion[Tasks.tasks.Chem4] or SaveData.TaskCompletion[Tasks.tasks.Curiosity]:
				return true
		Tasks.tasks.Supply:
			if not SaveData.TaskCompletion[Tasks.tasks.KindaSabotage]:
				return true
		Tasks.tasks.KindaSabotage:
			if not SaveData.TaskCompletion[Tasks.tasks.Supply]:
				return true
		Tasks.tasks.WoodsKeeper:
			if SaveData.TaskCompletion[Tasks.tasks.Supply] or SaveData.TaskCompletion[Tasks.tasks.KindaSabotage]:
				return true
		Tasks.tasks.Coll3:
			if not SaveData.TaskCompletion[Tasks.tasks.Sadist]:
				return true
		Tasks.tasks.Sadist:
			if not SaveData.TaskCompletion[Tasks.tasks.Coll3]:
				return true
		Tasks.tasks.Terragroup:
			if SaveData.TaskCompletion[Tasks.tasks.Samples]:
				if SaveData.TaskCompletion[Tasks.tasks.Coll3] or SaveData.TaskCompletion[Tasks.tasks.Sadist]:
					return true
	print(SaveData.TaskCompletion[Tasks.tasks.Chem4])
	print(SaveData.TaskCompletion[Tasks.tasks.Curiosity])
	return false

func specialboyornot(task: Tasks.tasks) -> bool:
	for i in Tasks.decision_tasks.size():
		if task == Tasks.decision_tasks[i]:
			return true
	return false

func save():
	var save_dict:= SaveData.TaskCompletion
	return save_dict

func save_checklist():
	var save_list = FileAccess.open("user://checklist.timmy", FileAccess.WRITE)
	var save_data = save()
		# JSON provides a static method to serialized JSON string.
	var json_string = JSON.stringify(save_data)
		# Store the save dictionary as a new line in the save file.
	save_list.store_line(json_string)

func load_checklist():
	if not FileAccess.file_exists("user://checklist.timmy"):
		return # Error! We don't have a save to load.
	
	# Load the file line by line and process that dictionary to restore
	# the object it represents.
	var save_list = FileAccess.open("user://checklist.timmy", FileAccess.READ)
	while save_list.get_position() < save_list.get_length():
		var json_string = save_list.get_line()

		# Creates the helper class to interact with JSON
		var json = JSON.new()

		# Check if there is any error while parsing the JSON string, skip in case of failure
		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue

		# Get the data from the JSON object
		var data = json.get_data()
		var loaded_data:= {}
		for i in data.keys():
			loaded_data[int(i)] = data[i]
		SaveData.TaskCompletion = loaded_data
