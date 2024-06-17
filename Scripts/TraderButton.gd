extends Button
@export var control: Control
@export var trader: Tasks.traders
var current_base: Texture2D
@export var base: Texture2D
@export var hover: Texture2D
@export var complete: Texture2D

var trader_completion: bool = false
var start_switch: bool = false


func _ready():
	mouse_entered.connect(enter)
	mouse_exited.connect(exit)
	Utility.update.connect(update)
	start_switch = true
	update()

func update() -> void:
	if trader == control.mode:
		if trader_completion:
			for i in %TaskData.reference_list.size():
				var data: TaskResource = %TaskData.reference_list[i]
				if data.trader == trader:
					if data.mutual_exclusives != []:
						continue
					if not SaveData.TaskCompletion[data.task_id]:
						trader_completion = false
						break
		else:
			for i in %TaskData.reference_list.size():
				var data: TaskResource = %TaskData.reference_list[i]
				if data.trader == trader:
					if data.mutual_exclusives != []:
						continue
					if not SaveData.TaskCompletion[data.task_id]:
						trader_completion = false
						break
					else:
						trader_completion = true
	if not start_switch and trader_completion and $"../../MainBody/TaskBox/Control".mode == trader:
		%CompletionAward.play()
	if trader_completion:
		current_base = complete
		icon = current_base
	else:
		current_base = base
		icon = current_base
	start_switch = false

func enter() -> void:
	Utility.hover_sound.emit()
	icon = hover
	
func exit() -> void:
	icon = current_base
