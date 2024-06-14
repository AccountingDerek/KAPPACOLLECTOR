extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = (Settings.hover_color == 4)
	Settings.apply_settings.connect(change_color)

func change_color() -> void:
	visible = (Settings.hover_color == 4)
	color = Color8(Settings.custom_color_r,Settings.custom_color_g,Settings.custom_color_b)
	#color.r = Settings.custom_color_r
	#color.g = Settings.custom_color_g
	#color.b = Settings.custom_color_b
