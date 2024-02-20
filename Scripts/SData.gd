class_name SkierData
extends Node

var trader_name: String = "Skier"
var complete: bool = false
var TraderTasks:= [
	Tasks.tasks.Supplier,
	Tasks.tasks.Extortion,
	Tasks.tasks.Stirrup,
	Tasks.tasks.FlashDrives1,
	Tasks.tasks.GoldenSwag,
	Tasks.tasks.Chem1,
	Tasks.tasks.Chem2,
	Tasks.tasks.Chem3,
	Tasks.tasks.Chem4,
	Tasks.tasks.Vit1,
	Tasks.tasks.Vit2,
	Tasks.tasks.FFtW1,
	Tasks.tasks.FFtW2,
	Tasks.tasks.LL1,
	Tasks.tasks.Setup,
	Tasks.tasks.Informed,
	Tasks.tasks.Chumming,
	Tasks.tasks.Bullshit,
	Tasks.tasks.Flint,
	Tasks.tasks.KindaSabotage,
	Tasks.tasks.RiggedGame,
	Tasks.tasks.SafeCorridor,
	Tasks.tasks.LongRoad,
	Tasks.tasks.MissingCargo
]

const TaskNames:= {
	Tasks.tasks.Supplier : "Supplier",
	Tasks.tasks.Extortion : "Extortion",
	Tasks.tasks.Stirrup : "Stirrup",
	Tasks.tasks.FlashDrives1 : "What's on the Flash Drive?",
	Tasks.tasks.GoldenSwag : "Golden Swag",
	Tasks.tasks.Chem1 : "Chemical - Part 1",
	Tasks.tasks.Chem2 : "Chemical - Part 2",
	Tasks.tasks.Chem3 : "Chemical - Part 3",
	Tasks.tasks.Chem4 : "Chemical - Part 4",
	Tasks.tasks.Vit1 : "Vitamins - Part 1",
	Tasks.tasks.Vit2 : "Vitamins - Part 2",
	Tasks.tasks.FFtW1 : "Friend from the West - Part 1",
	Tasks.tasks.FFtW2 : "Friend from the West - Part 2",
	Tasks.tasks.LL1 : "Lend-Lease - Part 1",
	Tasks.tasks.Setup : "Setup",
	Tasks.tasks.Informed : "Informed Means Armed",
	Tasks.tasks.Chumming : "Chumming",
	Tasks.tasks.Bullshit : "Bullshit",
	Tasks.tasks.Flint : "Flint",
	Tasks.tasks.KindaSabotage : "Kind of Sabotage",
	Tasks.tasks.RiggedGame : "Rigged Game",
	Tasks.tasks.SafeCorridor : "Safe Corridor",
	Tasks.tasks.LongRoad : "Long Road",
	Tasks.tasks.MissingCargo : "Missing Cargo",
}

func run_check() -> void:
	pass
