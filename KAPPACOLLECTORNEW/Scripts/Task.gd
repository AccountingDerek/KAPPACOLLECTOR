class_name TaskResource
extends Resource

@export_category("Technical")
@export var task_id: Tasks.tasks
@export var trader: Tasks.traders
@export var mutual_exclusives: Array[Tasks.tasks]
@export var post_choice: bool
## NOTE: ALL THE MUTUALLY EXCLUSIVE QUESTS GO *HERE*. NOT IN "FROM". thanks <3
@export var post_choice_mutual_exclusives: Array[Tasks.tasks]
@export_category("Description")
@export var task_name: String
@export var task_part: String
@export_multiline var description: String
@export var from: Array[Tasks.tasks]
@export var to: Array[Tasks.tasks]
@export var link: String
@export_multiline var additional_info: String
## NOTE: This is the displayed task name. task_name and task_part are used soley for the description box style.
var displayed_task_name: String
