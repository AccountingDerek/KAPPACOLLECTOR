extends Node

var reference_list:= {}

@export var PraporTasks: Array[TaskResource]
@export var TherapistTasks: Array[TaskResource]
@export var SkierTasks: Array[TaskResource]
@export var PeacekeeperTasks: Array[TaskResource]
@export var MechanicTasks: Array[TaskResource]
@export var RagmanTasks: Array[TaskResource]
@export var JaegerTasks: Array[TaskResource]
@export var Items: Array[TaskResource]
@onready var Trader2List:= {
	Tasks.traders.PRAPOR: PraporTasks,
	Tasks.traders.THERAPIST: TherapistTasks,
	Tasks.traders.SKIER: SkierTasks,
	Tasks.traders.PEACEKEEPER: PeacekeeperTasks,
	Tasks.traders.MECHANIC: MechanicTasks,
	Tasks.traders.RAGMAN: RagmanTasks,
	Tasks.traders.JAEGER: JaegerTasks,
	Tasks.traders.ITEMS: Items,
}



func _ready() -> void:
	generate_and_append(PraporTasks)
	generate_and_append(TherapistTasks)
	generate_and_append(SkierTasks)
	generate_and_append(PeacekeeperTasks)
	generate_and_append(MechanicTasks)
	generate_and_append(RagmanTasks)
	generate_and_append(JaegerTasks)
	generate_and_append(Items)

func generate_and_append(list: Array[TaskResource]):
	for p in list:
		print(p.task_id)
		if p.task_part != "":
			p.displayed_task_name = p.task_name + " - " + p.task_part
		else:
			p.displayed_task_name = p.task_name
		reference_list[p.task_id] = p
