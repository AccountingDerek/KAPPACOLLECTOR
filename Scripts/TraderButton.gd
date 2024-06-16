extends Button
@export var trader: Tasks.traders
@export var base: Texture2D
@export var hover: Texture2D
@export var complete: Texture2D
var trader_completion: bool = false
var start_switch: bool = false
@onready var hover_sfx = $"../../../Hover"
@onready var click = $"../../../Click"

func _ready():
	mouse_entered.connect(enter)
	mouse_exited.connect(exit)
	Utility.update.connect(update)
	start_switch = true
	update()

func update() -> void:
	if trader == $"../../MainBody/TaskBox/Control".mode:
		if trader_completion:
			for i in %TaskData.reference_list.size():
				var data: TaskResource = %TaskData.reference_list[i]
				if data.trader == trader:
					if not SaveData.TaskCompletion[data.task_id]:
						trader_completion = false
						break
		else:
			for i in %TaskData.reference_list.size():
				var data: TaskResource = %TaskData.reference_list[i]
				if data.trader == trader:
					if not SaveData.TaskCompletion[data.task_id]:
						trader_completion = false
						break
					else:
						trader_completion = true
	if not start_switch and trader_completion:
		%CompletionAward.play()
	start_switch = false

func enter() -> void:
	hover_sfx.play()
	icon = hover
	
func exit() -> void:
	icon = base
