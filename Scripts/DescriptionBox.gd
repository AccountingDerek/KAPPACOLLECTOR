extends Control
@export var quest_name: Label
@export var quest_type: Label
@export var requirements: Label
@export var previous: Label
@export var next: Label
@export var link: LinkButton

func _ready():
	hide()
	Utility.hover.connect(switch_description)

func switch_description(task: Tasks.tasks):
	show()
	quest_name.text = TaskDescriptions.TaskName[task]
	quest_type.text = TaskDescriptions.TaskPart[task]
	requirements.text = TaskDescriptions.TaskDescripts[task]
