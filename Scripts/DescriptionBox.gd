extends Control
@onready var scroll: Control = $ScrollContainer/Control
@onready var vbox: VBoxContainer = $ScrollContainer/Control/VBoxContainer
@onready var quest_name: Label = $"ScrollContainer/Control/VBoxContainer/Quest Name"
@onready var quest_type: Label = $"ScrollContainer/Control/VBoxContainer/Quest Type"
@onready var requirements: Label = $ScrollContainer/Control/VBoxContainer/Requirements
@onready var previous: Label = $ScrollContainer/Control/VBoxContainer/Previous
@onready var next: Label = $ScrollContainer/Control/VBoxContainer/Next
@onready var link: LinkButton = $ScrollContainer/Control/VBoxContainer/LinkButton

func _ready():
	hide()
	Utility.hover.connect(switch_description)

func switch_description(task: Tasks.tasks):
	show()
	quest_name.text = TaskDescriptions.TaskName[task]
	quest_type.text = TaskDescriptions.TaskPart[task]
	requirements.text = TaskDescriptions.TaskDescripts[task]
	previous.text = TaskDescriptions.Previous[task]
	next.text = TaskDescriptions.LeadsTo[task]
	link.uri = TaskDescriptions.WikiLinks[task]

func _process(delta):
	scroll.custom_minimum_size.y = vbox.position.y + vbox.size.y + 20
