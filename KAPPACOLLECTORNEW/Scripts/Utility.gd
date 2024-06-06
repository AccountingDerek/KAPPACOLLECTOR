extends Node

signal screen_switch(trader: Tasks.traders)
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
			if SaveData.TaskCompletion[Tasks.tasks.Chem3]:
				if SaveData.TaskCompletion[Tasks.tasks.Chem4] or SaveData.TaskCompletion[Tasks.tasks.Curiosity]:
					return false
				return true
			return false
		Tasks.tasks.Chem4:
			if SaveData.TaskCompletion[Tasks.tasks.Chem3]:
				if SaveData.TaskCompletion[Tasks.tasks.BigCustomer] or SaveData.TaskCompletion[Tasks.tasks.Curiosity]:
					return false
				return true
			return false
		Tasks.tasks.Curiosity:
			if SaveData.TaskCompletion[Tasks.tasks.Chem3]:
				if SaveData.TaskCompletion[Tasks.tasks.Chem4] or SaveData.TaskCompletion[Tasks.tasks.BigCustomer]:
					return false
				return true
			return false
		Tasks.tasks.SafeCorridor:
			if SaveData.TaskCompletion[Tasks.tasks.BigCustomer] or SaveData.TaskCompletion[Tasks.tasks.Chem4] or SaveData.TaskCompletion[Tasks.tasks.Curiosity]:
				return true
			return false
		Tasks.tasks.Supply:
			if SaveData.TaskCompletion[Tasks.tasks.KindaSabotage]:
				return false
		Tasks.tasks.KindaSabotage:
			if SaveData.TaskCompletion[Tasks.tasks.Supply]:
				return false
		Tasks.tasks.WoodsKeeper:
			if SaveData.TaskCompletion[Tasks.tasks.Supply] or SaveData.TaskCompletion[Tasks.tasks.KindaSabotage]:
				return true
			return false
		Tasks.tasks.Coll3:
			if SaveData.TaskCompletion[Tasks.tasks.Sadist]:
				return false
		Tasks.tasks.Sadist:
			if SaveData.TaskCompletion[Tasks.tasks.Coll3]:
				return false
		Tasks.tasks.Terragroup:
			if SaveData.TaskCompletion[Tasks.tasks.Samples]:
				if SaveData.TaskCompletion[Tasks.tasks.Coll3] or SaveData.TaskCompletion[Tasks.tasks.Sadist]:
					return true
			return false
	return true

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
