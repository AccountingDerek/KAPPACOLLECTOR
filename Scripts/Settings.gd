extends Node

enum HoverColors {
	RED,
	BLUE,
	GREEN,
	PINK,
	CUSTOM
}

signal apply_settings

var volume: int = 100
var hover_color: HoverColors = HoverColors.RED
var custom_color_r: int = 0
var custom_color_g: int = 0
var custom_color_b: int = 0
var background: int = 0
var dev_notes: bool = false

@onready var custom_color: Color = Color8(custom_color_r,custom_color_g,custom_color_b)

var Hover2Color:= {
	HoverColors.RED: Color8(255,0,0),
	HoverColors.BLUE: Color8(0,255,0),
	HoverColors.GREEN: Color8(0,0,255),
	HoverColors.PINK: Color8(255,0,255),
	HoverColors.CUSTOM: custom_color }
#add preloaded images here eventually
var Background2Image:= {
	0: 0,
	1: 0,
	2: 0,
	3: 0 }

func _ready():
	load_settings()
	Utility.update.connect(update)

func save_settings():
	var save_list = FileAccess.open("user://save.timmy", FileAccess.WRITE)
	var save_data: Array[int] = [volume, hover_color, custom_color_r, custom_color_b, custom_color_g, background, dev_notes]
	var json_string = JSON.stringify(save_data)
	save_list.store_line(json_string)
	print(save_data)
	apply_settings.emit()

func load_settings():
	if not FileAccess.file_exists("user://save.timmy"):
		return
	
	var save_list = FileAccess.open("user://save.timmy", FileAccess.READ)
	while save_list.get_position() < save_list.get_length():
		var json_string = save_list.get_line()
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue
		var data = json.get_data()
		var loaded_data: Array
		loaded_data = data
		volume = loaded_data[0]
		hover_color = loaded_data[1]
		custom_color.r = loaded_data[2]
		custom_color.g = loaded_data[3]
		custom_color.b = loaded_data[4]
		custom_color = Color8(custom_color_r,custom_color_g,custom_color_b)
		background = loaded_data[5]
		dev_notes = loaded_data[6]

func update():
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index(&"Master"), linear_to_db(volume/100))
	load_settings()
	apply_settings.emit()
