extends Control
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
		$VBoxContainer/Previous.hide()
		$VBoxContainer/Space3.hide()
		$"VBoxContainer/Next Header".hide()
		$VBoxContainer/Next.hide()
		$VBoxContainer/Space4.hide()
	else:
		$"VBoxContainer/Quest Part".show()
		$"VBoxContainer/Requirements Header".show()
		$VBoxContainer/Space2.show()
		$"VBoxContainer/Previous Header".show()
		$VBoxContainer/Previous.show()
		$VBoxContainer/Space3.show()
		$"VBoxContainer/Next Header".show()
		$VBoxContainer/Next.show()
		$VBoxContainer/Space4.show()
	show()
	quest_name.text = data.task_name
	quest_part.text = data.task_part
	requirements.clear()
	requirements.add_text(data.description)
	previous.text = generate_from_resources(data.from, true)
	next.text = generate_from_resources(data.to, false)
	note.clear()
	note.add_text(data.additional_info)
	link.uri = "placeholder"

func update() -> void: 
	note.visible = Settings.dev_notes
	pass

func generate_from_resources(array: Array[Tasks.tasks], from: bool) -> String:
	var result: String = ""
	if data.post_choice == true and from == true:
		for i in data.post_choice_mutual_exclusives:
			result += "• " + str(%TaskData.reference_list[i].displayed_task_name)+" OR\n"
		result = result.left(-3)
		for i in array:
			result += "• " + str(%TaskData.reference_list[i].displayed_task_name)+"\n"
		return result
	else:
		if array.size() == 0:
			return "-"
		else:
			for i in array:
				result += "• " + str(%TaskData.reference_list[i].displayed_task_name)+"\n"
		return result

func find_resource(task: Tasks.tasks) -> TaskResource:
	for i in %TaskData.MasterTaskList:
		if i.task_id == task:
			return i
	return

func apply_settings() -> void:
	note.visible = Settings.dev_notes

func _process(delta):
	self.custom_minimum_size.y = vbox.position.y + vbox.size.y
