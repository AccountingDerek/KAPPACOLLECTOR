@tool
extends Control
signal custom_check

@onready var label:= %Label as Label

@export var setting: Settings.SettingIDs
@export var setting_name: String = "":
	set(value):
		setting_name = value
		_update_label()
@export var show_on_custom: bool = false

@export_group("Range")
@onready var slider:= %HSlider as HSlider
@export var slider_enabled: bool:
	set(value):
		slider_enabled = value
		update_visibility()

@onready var number_box := %SpinBox as SpinBox
@export var number_enabled: bool:
	set(value):
		number_enabled = value
		update_visibility()

@export var min_value: float
@export var max_value: float = 1
@export var step: float
@export var allow_greater: bool
@export var allow_lesser: bool

@export_group("Option")
@onready var check_button:= %CheckButton as CheckButton
@export var check_enabled: bool:
	set(value):
		check_enabled = value
		update_visibility()
@onready var option_button := %OptionButton as OptionButton
@export var option_enabled: bool:
	set(value):
		option_enabled = value
		update_visibility()
@export var options: Array[String]

func _ready() -> void:
	update_visibility()
	_update_label()
	update_control_settings()
	custom_check.connect(custom_settings)

func update_control_settings() -> void:
	if Engine.is_editor_hint():
		return
	
	if slider_enabled:
		update_range_settings(slider)
	
	if number_enabled:
		update_range_settings(number_box)
	
	if option_enabled:
		for option in options:
			option_button.add_item(option)


func update_range_settings(range_node: Range) -> void:
	range_node.min_value = min_value
	range_node.max_value = max_value
	range_node.allow_lesser = allow_lesser
	range_node.allow_greater = allow_greater
	range_node.step = step

func update_visibility() -> void:
	if slider:
		slider.visible = slider_enabled
	if number_box:
		number_box.visible = number_enabled
	if check_button:
		check_button.visible = check_enabled
	if option_button:
		option_button.visible = option_enabled
	if Engine.is_editor_hint():
		notify_property_list_changed()
	change_settings()

func custom_settings():
	if show_on_custom:
		visible = (Settings.hover_color == Settings.HoverColors.CUSTOM)

func change_settings():
	match setting:
		Settings.SettingIDs.VOL:
			pass
		Settings.SettingIDs.HOVER:
			if option_button:
				match options:
					"Red":
						Settings.hover_color = Color(255,0,0)
					"Green":
						Settings.hover_color = Color(0,255,0)
					"Blue":
						Settings.hover_color = Color(0,0,255)
					"Pink":
						Settings.hover_color = Color(255,0,255)
					"Custom":
						Settings.hover_color = Settings.custom_color
			custom_check.emit()
		Settings.SettingIDs.CUSTOMR:
			if slider:
				Settings.custom_color_r = slider.value
		Settings.SettingIDs.CUSTOMG:
			if slider:
				Settings.custom_color_g = slider.value
		Settings.SettingIDs.CUSTOMB:
			if slider:
				Settings.custom_color_b = slider.value
		Settings.SettingIDs.BG:
			if option_button:
				match options:
					"Woods":
						Settings.background = Settings.Backgrounds.WOODS
					"Factory":
						Settings.background = Settings.Backgrounds.FACTORY
					"The Lab":
						Settings.background = Settings.Backgrounds.THELAB
					"Unheard":
						Settings.background = Settings.Backgrounds.UNHEARD
		Settings.SettingIDs.DEV:
			if check_button:
				Settings.dev_notes = check_button.toggle_mode

#region TOOL
func _update_label() -> void:
	if label:
		label.text = setting_name
