extends Node

var reference_list:= {}

@export var PraporTasks: TraderData
@export var TherapistTasks: TraderData
@export var SkierTasks: TraderData
@export var PeacekeeperTasks: TraderData
@export var MechanicTasks: TraderData
@export var RagmanTasks: TraderData
@export var JaegerTasks: TraderData
@export var Items: TraderData
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
		var link: String = p.displayed_task_name.replace(" ","_")
		p.link = link
		reference_list[p.task_id] = p
