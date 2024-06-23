extends Control

@export var vbox : VBoxContainer
var mode: Tasks.traders
var list: Array[TaskResource]

func _ready():
	Utility.screen_switch.connect(cycle)

func cycle(trader: Tasks.traders) -> void:
	## kill all lines
	for i in vbox.get_children():
		i.queue_free()
	## Sets the mode and grabs the current list to generate
	mode = trader
	list = TaskData.Trader2List[trader]
	custom_minimum_size.y = list.size() * 34
	## Create list.size() lines
	for i in list:
		var line = preload("res://Scenes/new_line.tscn").instantiate()
		#technical stuff. adds all the necessary data
		line.name = i.displayed_task_name
		line.assigned_task = i.task_id
		line.from = i.from
		#mutual exclusive check!
		line.mutual_exclusives = i.mutual_exclusives
		if i.post_choice:
			line.post_choice = true
			line.post_choice_mutual_exclusives = i.post_choice_mutual_exclusives
		#it's textin' time
		line.generate_text(i.displayed_task_name)
		#adds the node
		vbox.add_child(line)
	for i in vbox.get_children():
			i.update()


func _on_prapor_pressed():
	%Click.play()
	cycle(Tasks.traders.PRAPOR)

func _on_therapist_pressed():
	%Click.play()
	cycle(Tasks.traders.THERAPIST)

func _on_skier_pressed():
	%Click.play()
	cycle(Tasks.traders.SKIER)

func _on_peacekeeper_pressed():
	%Click.play()
	cycle(Tasks.traders.PEACEKEEPER)

func _on_mechanic_pressed():
	%Click.play()
	cycle(Tasks.traders.MECHANIC)

func _on_ragman_pressed():
	%Click.play()
	cycle(Tasks.traders.RAGMAN)

func _on_jaeger_pressed():
	%Click.play()
	cycle(Tasks.traders.JAEGER)

func _on_items_pressed():
	%Click.play()
	cycle(Tasks.traders.ITEMS)
