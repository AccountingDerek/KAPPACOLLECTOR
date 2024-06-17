extends MarginContainer
@export var label: Label
@export var hover: AudioStreamPlayer
@export var undo: AudioStreamPlayer
@export var button: Button
var assigned_task: Tasks.tasks
@onready var task_done: bool = false
var from: Array[Tasks.tasks] = []
var mutual_exclusives: Array[Tasks.tasks]
var post_choice: bool = false
var post_choice_mutual_exclusives: Array[Tasks.tasks]

func _ready():
	button.mouse_entered.connect(onMouseEntered)
	button.mouse_exited.connect(onMouseExited)
	button.pressed.connect(logic)
	Settings.apply_settings.connect(update)
	Utility.update.connect(update)
	Utility.reset.connect(reset)
	task_done = SaveData.TaskCompletion[assigned_task]
	update()

func onMouseEntered():
	Utility.hover.emit(assigned_task)
	if not task_done:
		if Settings.hover_color == Settings.HoverColors.CUSTOM:
			label.add_theme_color_override("font_color", Color8(Settings.custom_color_r,Settings.custom_color_g,Settings.custom_color_b))
		else: label.add_theme_color_override("font_color", Settings.Hover2Color[Settings.hover_color])
	if Settings.volume > 0: hover.play()

func onMouseExited():
	if not task_done:
		label.add_theme_color_override("font_color", Color8(255,255,255))

func generate_text(text: String):
	label.text = text

func logic():
	var counter: int = 0
	#check to see if this is an undo
	if task_done:
		task_done = false
		update()
		Utility.update.emit()
		return
	#check to see if this is a special case
	elif mutual_exclusives != []:
		for i in mutual_exclusives:
			if SaveData.TaskCompletion[i]:
				task_done = false
				update()
				Utility.update.emit()
				return
	#regular ol' check. works like a treat, at least so far.
	if post_choice:
		for i in post_choice_mutual_exclusives:
			if SaveData.TaskCompletion[i]:
				counter += 1
		if counter == 0:
			task_done == false
		else:
			if check_from():
				task_done = true
			else:
				task_done = false
	else:
		if check_from():
			task_done = true
		else:
			task_done = false
	undo.play()
	update()
	Utility.update.emit()

func update():
	hover.set_volume_db((Settings.volume/2)-50)
	undo.set_volume_db((Settings.volume/2)-50)
	if task_done:
		SaveData.TaskCompletion[assigned_task] = true
		label.add_theme_color_override("font_color", Color8(0,0,0))
	else:
		SaveData.TaskCompletion[assigned_task] = false
		label.add_theme_color_override("font_color", Color8(255,255,255))

func check_from() -> bool:
	var counter: int = 0
	for i in from:
		if SaveData.TaskCompletion[i]:
			counter = counter + 1
	if counter == from.size():
		return true
	else:
		return false

func reset():
	task_done = false
	update()
