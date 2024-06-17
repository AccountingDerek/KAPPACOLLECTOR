extends Control
const prefix: String = "https://escapefromtarkov.fandom.com/wiki/"
@export var vbox: VBoxContainer
@export var quest_name: Label
@export var quest_part: Label
@export var requirements: RichTextLabel
@export var pevio: VBoxContainer
@export var nexus: VBoxContainer
@export var link: LinkButton
@export var note: RichTextLabel
@export var toggled: Array[Node]
@export var data: TaskResource

func _ready():
	hide()
	Utility.hover.connect(switch_description)
	Utility.update.connect(update)
	Settings.apply_settings.connect(apply_settings)

func switch_description(task: Tasks.tasks):
	data = %TaskData.reference_list[task]
	if data.trader == Tasks.traders.ITEMS:
		for i in toggled:
			i.hide()
	else:
		for i in toggled:
			i.show()
	show()
	quest_name.text = data.task_name
	quest_part.text = data.task_part
	requirements.clear()
	requirements.add_text(data.description)
	for i in pevio.get_children():
		i.queue_free()
	for i in nexus.get_children():
		i.queue_free()
	generate_from_resources(data.from, true)
	generate_from_resources(data.to, false)
	link.uri = prefix + data.link
	note.clear()
	if data.additional_info == "":
		note.hide()
	else: note.show()
	note.add_text(data.additional_info)

func update() -> void: 
	note.visible = Settings.dev_notes
	pass

func generate_from_resources(array: Array[Tasks.tasks], from: bool):
	if data.post_choice == true and from == true:
		for i in data.post_choice_mutual_exclusives.size():
			var desc_but:= preload("res://Scenes/description_button.tscn").instantiate()
			desc_but.id = data.post_choice_mutual_exclusives[i]
			desc_but.trader = %TaskData.reference_list[data.post_choice_mutual_exclusives[i]].trader
			desc_but.displayed_text = %TaskData.reference_list[data.post_choice_mutual_exclusives[i]].displayed_task_name
			desc_but.data = data
			desc_but.complete = SaveData.TaskCompletion[data.post_choice_mutual_exclusives[i]]
			if i == data.post_choice_mutual_exclusives.size() -1:
				desc_but.override = true
			if from:
				pevio.add_child(desc_but)
			else:
				nexus.add_child(desc_but)
		if array.size() == 0:
			var blank:= Label.new()
			blank.add_theme_font_size_override("font_size", 20)
			blank.text = "-"
			if from:
				pevio.add_child(blank)
			else:
				nexus.add_child(blank)
		else:
			create_buttons(array, from)
	else:
		if array.size() == 0:
			var blank:= Label.new()
			blank.add_theme_font_size_override("font_size", 20)
			blank.text = "-"
			if from:
				pevio.add_child(blank)
			else:
				nexus.add_child(blank)
		else:
			create_buttons(array, from)

func find_resource(task: Tasks.tasks) -> TaskResource:
	for i in %TaskData.MasterTaskList:
		if i.task_id == task:
			return i
	return

func apply_settings() -> void:
	note.visible = Settings.dev_notes

func _process(delta):
	self.custom_minimum_size.y = maxi(vbox.size.y + 167, 517)


func _on_link_button_pressed():
	%Click.play()

func create_buttons(array: Array[Tasks.tasks], from: bool):
	for i in array:
		var desc_but: Button = preload("res://Scenes/description_button.tscn").instantiate()
		desc_but.id = i
		desc_but.trader = %TaskData.reference_list[i].trader
		desc_but.displayed_text = %TaskData.reference_list[i].displayed_task_name
		desc_but.data = data
		desc_but.complete = SaveData.TaskCompletion[i]
		if from:
			pevio.add_child(desc_but)
		else:
			nexus.add_child(desc_but)
