extends TextureRect


func _ready():
	Settings.apply_settings.connect(change_bg)
	change_bg()


func change_bg() -> void:
	texture = Settings.Background2Image[Settings.background]
