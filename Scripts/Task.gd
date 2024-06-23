class_name TaskResource
extends Resource

@export_category("Technical")
@export var task_id: String
@export var trader: Tasks.traders
@export var mutual_exclusives: Array[String]
@export var post_choice: bool
## NOTE: ALL THE MUTUALLY EXCLUSIVE QUESTS GO *HERE*. NOT IN "FROM". thanks <3
@export var post_choice_mutual_exclusives: Array[String]
@export_category("Description")
@export var task_name: String
@export var task_part: String
@export_multiline var description: String
@export var from: Array[String]
@export var to: Array[String]
@export var link: String
@export_multiline var additional_info: String
## NOTE: This is the displayed task name. task_name and task_part are used soley for the description box style.
var displayed_task_name: String
