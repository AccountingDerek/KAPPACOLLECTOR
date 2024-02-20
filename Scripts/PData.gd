class_name PraporData
extends Node

var trader_name: String = "Prapor"
var complete: bool = false

var TraderTasks:= [
	Tasks.tasks.Debut,
	Tasks.tasks.Search,
	Tasks.tasks.Checking,
	Tasks.tasks.Shootout,
	Tasks.tasks.PastDelivery,
	Tasks.tasks.BPDepot,
	Tasks.tasks.Bunker1,
	Tasks.tasks.Bunker2,
	Tasks.tasks.BadRep,
	Tasks.tasks.IceCream,
	Tasks.tasks.Renegades,
	Tasks.tasks.Documents,
	Tasks.tasks.Postman1,
	Tasks.tasks.ShakingupTeller,
	Tasks.tasks.Punisher1,
	Tasks.tasks.Punisher2,
	Tasks.tasks.Punisher3,
	Tasks.tasks.Punisher4,
	Tasks.tasks.Punisher5,
	Tasks.tasks.Punisher6,
	Tasks.tasks.Anesthesia,
	Tasks.tasks.Grenadier,
	Tasks.tasks.TestDrive1,
	Tasks.tasks.Mediator,
	Tasks.tasks.PolikhimHobo,
	Tasks.tasks.Regulated,
	Tasks.tasks.BigCustomer,
	Tasks.tasks.Intimidator,
	Tasks.tasks.EasyJob1,
	Tasks.tasks.EasyJob2,
	Tasks.tasks.Recon
]

const TaskNames:= {
	Tasks.tasks.Debut : "Debut",
	Tasks.tasks.Search : "Search Mission",
	Tasks.tasks.Checking : "Background Check",
	Tasks.tasks.Shootout : "Shootout Picnic",
	Tasks.tasks.PastDelivery : "Delivery from the Past",
	Tasks.tasks.BPDepot : "BP Depot",
	Tasks.tasks.Bunker1 : "The Bunker - Part 1",
	Tasks.tasks.Bunker2 : "The Bunker - Part 2",
	Tasks.tasks.BadRep : "Bad Rep Evidence",
	Tasks.tasks.IceCream : "Ice Cream Cones",
	Tasks.tasks.Renegades : "No Place for Renegades",
	Tasks.tasks.Documents : "Documents",
	Tasks.tasks.Postman1 : "Postman Pat - Part 1",
	Tasks.tasks.ShakingupTeller : "Shaking up the Teller",
	Tasks.tasks.Punisher1 : "The Punisher - Part 1",
	Tasks.tasks.Punisher2 : "The Punisher - Part 2",
	Tasks.tasks.Punisher3 : "The Punisher - Part 3",
	Tasks.tasks.Punisher4 : "The Punisher - Part 4",
	Tasks.tasks.Punisher5 : "The Punisher - Part 5",
	Tasks.tasks.Punisher6 : "The Punisher - Part 6",
	Tasks.tasks.Anesthesia : "Anesthesia",
	Tasks.tasks.Grenadier : "Grenadier",
	Tasks.tasks.TestDrive1 : "Test Drive - Part 1",
	Tasks.tasks.Mediator : "Perfect Mediator",
	Tasks.tasks.PolikhimHobo : "Polikhim Hobo",
	Tasks.tasks.Regulated : "Regulated Materials",
	Tasks.tasks.BigCustomer : "Big Customer",
	Tasks.tasks.Intimidator : "Intimidator",
	Tasks.tasks.EasyJob1 : "Easy Job - Part 1",
	Tasks.tasks.EasyJob2 : "Easy Job - Part 2",
	Tasks.tasks.Recon : "Reconnaissance",
}
func _ready():
	print(TraderTasks.size())
	Utility.update.connect(update)

func update() -> void:
	if get_owner().current_screen == get_parent().get_parent():
		var completion_index: int = 0
		if not complete:
			completion_index = run_check()
		if completion_index >= TraderTasks.size() and not complete:
			complete = true
			Utility.completion.emit()
			get_parent().complete = true
		if completion_index < TraderTasks.size():
				complete = false
				get_parent().complete = false

func run_check() -> int:
	var completion_index: int = 0
	for i in TraderTasks.size():
			if Utility.specialboyornot(TraderTasks[i]):
				completion_index = completion_index + 1
			else:
				if SaveData.TaskCompletion[TraderTasks[i]]:
					completion_index = completion_index + 1
	return completion_index
