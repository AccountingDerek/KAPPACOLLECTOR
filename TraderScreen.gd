extends Control
@onready var data = $Data
@onready var hbox = $HBoxContainer
@onready var vbox = $HBoxContainer/VBoxContainer
var complete: bool = false

func _ready():
	custom_minimum_size.y = data.TraderTasks.size() * 34
	for i in data.TraderTasks.size():
		var line = preload("res://new_line.tscn").instantiate()
		line.name = str(i)
		line.assigned_task = data.TraderTasks[i]
		line.generate_text(data.TaskNames[data.TraderTasks[i]])
		vbox.add_child(line)
	for i in vbox.get_children():
		i.update()
