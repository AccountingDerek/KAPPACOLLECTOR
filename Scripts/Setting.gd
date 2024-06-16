@tool
extends Control

signal cycle_custom_visibility

@export var setting_variable: String:
	set(value):
		setting_variable = value
		update_configuration_warnings()

@onready var label:= %Label as Label
@export var setting_label: String = "":
	set(value):
		setting_label = value
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
	update()
	custom_settings()
	Utility.update.connect(update)
	Settings.apply_settings.connect(custom_settings)
	cycle_custom_visibility.connect(custom_settings)

func update() -> void:
	label.text = setting_label
	
	update_visibility()
	_update_label()
	
	if Engine.is_editor_hint():
		return
	
	update_control_settings()
	
	load_variable()
	
	connect_signals()

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

func custom_settings():
	if show_on_custom:
		visible = (Settings.hover_color == 4)

#region TOOL
func _update_label() -> void:
	if label:
		label.text = setting_label

func connect_signals() -> void:
	if Engine.is_editor_hint():
		return
	
	if slider_enabled:
		slider.value_changed.connect(set_variable)
	
	if number_enabled:
		number_box.value_changed.connect(set_variable)
	
	if check_enabled:
		check_button.toggled.connect(set_variable)
	
	if option_enabled:
		option_button.item_selected.connect(set_variable)

func load_variable() -> void:
	if Engine.is_editor_hint():
		return
	
	if setting_variable.is_empty():
		return
	
	var variable_exists: bool = setting_variable in Settings
	assert(variable_exists, setting_variable + " is not a variable in Settings")
	if not variable_exists:
		queue_free()
	
	var value: Variant = Settings.get(setting_variable)
	slider.value = value
	number_box.value = value
	option_button.selected = value
	check_button.button_pressed = value


func set_variable(value: Variant) -> void:
	if Engine.is_editor_hint():
		return
	Settings.set(setting_variable, value)
	Settings.save_settings()
	cycle_custom_visibility.emit()
	load_variable()
