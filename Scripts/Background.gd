extends TextureRect

##WHOOPS SORRY THIS IS THE SECRET FUNCTION SCRIPT NOW MY BAD Y'ALL
var secret_string: String = ""
@export var settings_texture: TextureRect
func _ready():
	Utility.click_sound.connect(%Click.play)
	Utility.hover_sound.connect(%Hover.play)
	Settings.apply_settings.connect(change_bg)
	Utility.update.connect(update)
	change_bg()
	update()

func change_bg() -> void:
	texture = Settings.Background2Image[Settings.background]

func update() -> void:
	%CompletionAward.set_volume_db((Settings.volume/2)-50)
	%Hover.set_volume_db((Settings.volume/2)-50)
	%Click.set_volume_db((Settings.volume/2)-50)

func secret():
	match secret_string:
		"HOG":
			settings_texture.texture = preload("res://VFX/HOG.jpg")
			texture = preload("res://VFX/HOG.jpg")
			secret_string = ""
		"HOUSE":
			settings_texture.texture = preload("res://VFX/livehousereact.png")
			texture = preload("res://VFX/livehousereact.png")
			secret_string = ""
		"TWITTER":
			settings_texture.texture = preload("res://VFX/twitter.png")
			texture = preload("res://VFX/twitter.png")
			secret_string = ""
		"FUCK":
			settings_texture.texture = preload("res://Icons/stop fucking around.png")
			texture = preload("res://Icons/stop fucking around.png")
			secret_string = ""

func _input(event):
	if event is InputEventKey and event.pressed:
		secret_string += event.as_text()
		%SecretTimer.start()
		print(secret_string)
		secret()

func _on_secret_timer_timeout():
	secret_string = ""

func click():
	%Click.play()
