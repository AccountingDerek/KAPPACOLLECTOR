extends MarginContainer
@export var label: Label
@export var hover: AudioStreamPlayer
@export var complete: AudioStreamPlayer
@export var undo: AudioStreamPlayer
@export var button: Button
var assigned_task: Tasks.tasks
@onready var task_done: bool = SaveData.TaskCompletion[assigned_task]

func _ready():
	button.connect("mouse_entered",onMouseEntered)
	button.connect("mouse_exited",onMouseExited)
	button.connect("pressed", logic)
	Utility.update.connect(update)

func onMouseEntered():
	Utility.hover.emit(assigned_task)
	if not task_done:
		label.add_theme_color_override("font_color", Color(255,0,0))
	if not Utility.hovering:
		Utility.hovering = true
		hover.play()
		Utility.hovering = false

func onMouseExited():
	if not task_done:
		label.add_theme_color_override("font_color", Color(255,255,255))

func generate_text(text: String):
	label.text = text

func logic():
	#check to see if this is an undo
	if SaveData.TaskCompletion[assigned_task]:
		SaveData.TaskCompletion[assigned_task] = false
		undo.play()
	#check to see if this is a special case
	elif Utility.specialboyornot(assigned_task):
		if Utility.special_case(assigned_task):
			SaveData.TaskCompletion[assigned_task] = true
			label.add_theme_color_override("font_color", Color(0,0,0))
			complete.play()
			pass
		else:
			SaveData.TaskCompletion[assigned_task] = false
			label.add_theme_color_override("font_color", Color(255,255,255))
			pass
	#regular ol' check. works like a treat, at least so far.
	else:
		var check_index: int = 0
		for i in Tasks.taskrequirements[assigned_task].size():
			if SaveData.TaskCompletion[Tasks.taskrequirements[assigned_task][i]] == true:
				check_index = check_index + 1
		if check_index == Tasks.taskrequirements[assigned_task].size():
			SaveData.TaskCompletion[assigned_task] = true
			complete.play()
		else:
			SaveData.TaskCompletion[assigned_task] = false
	Utility.update.emit()

func update():
	if SaveData.TaskCompletion[assigned_task]:
		task_done = true
		label.add_theme_color_override("font_color", Color(0,0,0))
	else:
		task_done = false
		label.add_theme_color_override("font_color", Color(255,255,255))
