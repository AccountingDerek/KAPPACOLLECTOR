extends Control
const prefix: String = "https://escapefromtarkov.fandom.com/wiki/"
@onready var vbox = $VBoxContainer
@onready var quest_name: Label = $"VBoxContainer/Quest Name"
@onready var quest_part: Label = $"VBoxContainer/Quest Part"
@onready var requirements: RichTextLabel = $VBoxContainer/Requirements
@onready var previous: Label = $VBoxContainer/Previous
@onready var next: Label = $VBoxContainer/Next
@onready var link: LinkButton = $VBoxContainer/LinkButton
@onready var note: RichTextLabel = $VBoxContainer/DEVNOTE
@export var backupResource: TaskResource
@onready var data: TaskResource

func _ready():
	hide()
	Utility.hover.connect(switch_description)
	Utility.update.connect(update)
	Settings.apply_settings.connect(apply_settings)

func switch_description(task: Tasks.tasks):
	data = %TaskData.reference_list[task]
	if data.trader == Tasks.traders.ITEMS:
		$"VBoxContainer/Quest Part".hide()
		$"VBoxContainer/Requirements Header".hide()
		$VBoxContainer/Space2.hide()
		$"VBoxContainer/Previous Header".hide()
		$VBoxContainer/Pevio.hide()
		$VBoxContainer/Space3.hide()
		$"VBoxContainer/Next Header".hide()
		$VBoxContainer/Nexus.hide()
		$VBoxContainer/Space4.hide()
	else:
		$"VBoxContainer/Quest Part".show()
		$"VBoxContainer/Requirements Header".show()
		$VBoxContainer/Space2.show()
		$"VBoxContainer/Previous Header".show()
		$VBoxContainer/Pevio.show()
		$VBoxContainer/Space3.show()
		$"VBoxContainer/Next Header".show()
		$VBoxContainer/Nexus.show()
		$VBoxContainer/Space4.show()
	show()
	quest_name.text = data.task_name
	quest_part.text = data.task_part
	requirements.clear()
	requirements.add_text(data.description)
	for i in $"VBoxContainer/Pevio/Previous Container".get_children():
		i.queue_free()
	for i in $"VBoxContainer/Nexus/Next Container".get_children():
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
			if i == data.post_choice_mutual_exclusives.size() -1:
				desc_but.override = true
			if from:
				$"VBoxContainer/Pevio/Previous Container".add_child(desc_but)
			else:
				$"VBoxContainer/Nexus/Next Container".add_child(desc_but)
			
		for i in array:
			var desc_but:= preload("res://Scenes/description_button.tscn").instantiate()
			desc_but.id = i
			desc_but.trader = %TaskData.reference_list[i].trader
			desc_but.displayed_text = %TaskData.reference_list[i].displayed_task_name
			desc_but.data = data
			if from:
				$"VBoxContainer/Pevio/Previous Container".add_child(desc_but)
			else:
				$"VBoxContainer/Nexus/Next Container".add_child(desc_but)
	else:
		if array.size() == 0:
			return "-"
		else:
			for i in array:
				var desc_but: Button = preload("res://Scenes/description_button.tscn").instantiate()
				desc_but.id = i
				desc_but.trader = %TaskData.reference_list[i].trader
				desc_but.displayed_text = %TaskData.reference_list[i].displayed_task_name
				desc_but.data = data
				if from:
					$"VBoxContainer/Pevio/Previous Container".add_child(desc_but)
				else:
					$"VBoxContainer/Nexus/Next Container".add_child(desc_but)

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
