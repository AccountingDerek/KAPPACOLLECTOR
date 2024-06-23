extends Node

var reference_list:= {}

@export var PraporTasks: TraderData = preload("res://Trader Data/Prapor.tres")
@export var TherapistTasks: TraderData = preload("res://Trader Data/Therapist.tres")
@export var SkierTasks: TraderData = preload("res://Trader Data/Skier.tres")
@export var PeacekeeperTasks: TraderData = preload("res://Trader Data/Peacekeeper.tres")
@export var MechanicTasks: TraderData = preload("res://Trader Data/Mechanic.tres")
@export var RagmanTasks: TraderData = preload("res://Trader Data/Ragman.tres")
@export var JaegerTasks: TraderData = preload("res://Trader Data/Jaeger.tres")
@export var Items: TraderData = preload("res://Trader Data/Items.tres")
@onready var Trader2List:= {
	Tasks.traders.PRAPOR: PraporTasks.TaskDataArray,
	Tasks.traders.THERAPIST: TherapistTasks.TaskDataArray,
	Tasks.traders.SKIER: SkierTasks.TaskDataArray,
	Tasks.traders.PEACEKEEPER: PeacekeeperTasks.TaskDataArray,
	Tasks.traders.MECHANIC: MechanicTasks.TaskDataArray,
	Tasks.traders.RAGMAN: RagmanTasks.TaskDataArray,
	Tasks.traders.JAEGER: JaegerTasks.TaskDataArray,
	Tasks.traders.ITEMS: Items.TaskDataArray,
}

func _ready() -> void:
	generate_and_append(PraporTasks.TaskDataArray)
	generate_and_append(TherapistTasks.TaskDataArray)
	generate_and_append(SkierTasks.TaskDataArray)
	generate_and_append(PeacekeeperTasks.TaskDataArray)
	generate_and_append(MechanicTasks.TaskDataArray)
	generate_and_append(RagmanTasks.TaskDataArray)
	generate_and_append(JaegerTasks.TaskDataArray)
	generate_and_append(Items.TaskDataArray)

func generate_and_append(list: Array[TaskResource]):
	for p in list:
		if p.task_part != "":
			p.displayed_task_name = p.task_name + " - " + p.task_part
		else:
			p.displayed_task_name = p.task_name
		p.link = p.displayed_task_name.replace(" ","_")
		reference_list[p.task_id] = p

func DEBUG_stringify(list: Array[TaskResource], output: String):
	var temp_data:= TraderData.new()
	for i in list:
		i.task_id = i.task_string
		i.mutual_exclusives = i.mutuals
		i.post_choice_mutual_exclusives = i.pcme
		i.from = i.prev
		i.to = i.next
		temp_data.TaskDataArray.append(i)
	ResourceSaver.save(temp_data, output)
	
