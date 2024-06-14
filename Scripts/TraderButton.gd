extends Button
@export var base: Texture2D
@export var hover: Texture2D
@export var complete: Texture2D

# Called when the node enters the scene tree for the first time.
func _ready():
	icon = base
	mouse_entered.connect(enter)
	mouse_exited.connect(exit)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func enter() -> void:
	icon = hover
	
func exit() -> void:
	icon = base
