class_name TaskResource
extends Resource

@export_category("Technical")
@export var taskid: Tasks.tasks
@export var trader: Tasks.traders
@export var questline: Array[Tasks.questlines]
@export var dependencies: Array[Tasks.tasks]
@export var mutualexclusives: Array[Tasks.tasks]
@export_category("Description")
@export var task_name: String
@export var task_part: String
@export var description: String
@export var from: String
@export var to: String
@export var link: String
