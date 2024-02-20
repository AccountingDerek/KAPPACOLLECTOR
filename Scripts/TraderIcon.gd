extends Area2D
@export var trader: SaveData.traders
@export var texture: Texture2D
@export var complete_texture: Texture2D
@export var screen: ScrollContainer
var active: bool = false
var complete: bool = false


func _ready():
	if complete:
		$ButtonIcon.texture = complete_texture
	else:
		$ButtonIcon.texture = texture
	input_pickable = true
	connect("mouse_entered",onMouseEntered)
	connect("mouse_exited",onMouseExited)
	Utility.screen_switch.connect(reset)
	Utility.update.connect(update)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("mouse1") and active:
		Utility.screen_switch.emit()
		get_owner().current_screen = screen
		screen.show()

func onMouseEntered() -> void:
	active = true

func onMouseExited() -> void:
	active = false

func reset() -> void:
	screen.hide()

func update():
	if complete:
		$ButtonIcon.texture = complete_texture
	else:
		$ButtonIcon.texture = texture
