class_name RagmanData
extends Node

var trader_name: String = "Ragman"
var complete: bool = false

var TraderTasks:= [
	Tasks.tasks.OnlyBusiness,
	Tasks.tasks.MUGA,
	Tasks.tasks.BigSale,
	Tasks.tasks.FuelMatter,
	Tasks.tasks.Inventory,
	Tasks.tasks.Blood1,
	Tasks.tasks.DressedtoKill,
	Tasks.tasks.Gratitude,
	Tasks.tasks.Delivery,
	Tasks.tasks.Scav,
	Tasks.tasks.SalesNight,
	Tasks.tasks.Data1,
	Tasks.tasks.Data2,
	Tasks.tasks.Minibus,
	Tasks.tasks.Sew1,
	Tasks.tasks.Blood2,
	Tasks.tasks.Blood3,
	Tasks.tasks.Sew2,
	Tasks.tasks.KeytoSuccess,
	Tasks.tasks.NoFuss,
	Tasks.tasks.Supervisor,
	Tasks.tasks.Sew3,
	Tasks.tasks.LHinaC1,
	Tasks.tasks.LHinaC2,
	Tasks.tasks.Sew4,
	Tasks.tasks.Charisma
]

const TaskNames:= {
	Tasks.tasks.OnlyBusiness : "Only Business",
	Tasks.tasks.MUGA : "Make ULTRA Great Again",
	Tasks.tasks.BigSale : "Big Sale",
	Tasks.tasks.FuelMatter : "A Fuel Matter",
	Tasks.tasks.Inventory : "Inventory Check",
	Tasks.tasks.Blood1 : "The Blood of War - Part 1",
	Tasks.tasks.DressedtoKill : "Dressed to Kill",
	Tasks.tasks.Gratitude : "Gratitude",
	Tasks.tasks.Delivery : "Hot Delivery",
	Tasks.tasks.Scav : "Scavenger",
	Tasks.tasks.SalesNight : "Sales Night",
	Tasks.tasks.Data1 : "Database - Part 1",
	Tasks.tasks.Data2 : "Database - Part 2",
	Tasks.tasks.Minibus : "Minibus",
	Tasks.tasks.Sew1 : "Sew it Good - Part 1",
	Tasks.tasks.Blood2 : "The Blood of War - Part 2",
	Tasks.tasks.Blood3 : "The Blood of War - Part 3",
	Tasks.tasks.Sew2 : "Sew it Good - Part 2",
	Tasks.tasks.KeytoSuccess : "The Key to Success",
	Tasks.tasks.NoFuss : "No Fuss Needed",
	Tasks.tasks.Supervisor : "Supervisor",
	Tasks.tasks.Sew3 : "Sew it Good - Part 3",
	Tasks.tasks.LHinaC1 : "Living High is Not a Crime - Part 1",
	Tasks.tasks.LHinaC2 : "Living High is Not a Crime - Part 2",
	Tasks.tasks.Sew4 : "Sew it Good - Part 4",
	Tasks.tasks.Charisma : "Charisma Brings Success",
}

func run_check() -> void:
	pass
