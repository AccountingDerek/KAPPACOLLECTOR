extends Control
@onready var vbox = $VBoxContainer
@onready var quest_name: Label = $"VBoxContainer/Quest Name"
@onready var quest_part: Label = $"VBoxContainer/Quest Part"
@onready var requirements: RichTextLabel = $VBoxContainer/Requirements
@onready var previous: Label = $VBoxContainer/Previous
@onready var next: Label = $VBoxContainer/Next
@onready var link: LinkButton = $VBoxContainer/LinkButton
@export var backupResource: TaskResource
func _ready():
	hide()
	Utility.hover.connect(switch_description)

func switch_description(task: Tasks.tasks):
	var data: TaskResource = %TaskData.reference_list[task]
	show()
	quest_name.text = data.task_name
	quest_part.text = data.task_part
	requirements.clear()
	requirements.add_text(data.description)
	previous.text = generate_from_resources(data.from)
	next.text = generate_from_resources(data.to)
	link.uri = "placeholder"

func generate_from_resources(array: Array[Tasks.tasks]) -> String:
	var result: String = ""
	for i in array:
		result += "• " + str(%TaskData.reference_list[i].displayed_task_name)+"\n"
	return result

func find_resource(task: Tasks.tasks) -> TaskResource:
	for i in %TaskData.MasterTaskList:
		if i.task_id == task:
			return i
	return

func _process(delta):
	self.custom_minimum_size.y = vbox.position.y + vbox.size.y + 20
