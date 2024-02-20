extends Control

@export var complete_trader_sound: AudioStreamPlayer
@export var kappa_acquired: AudioStreamPlayer
var current_screen: ScrollContainer

func _ready():
	current_screen = $PraporScreen
	Utility.completion.connect(func() -> void:
		complete_trader_sound.play())

