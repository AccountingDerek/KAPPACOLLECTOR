class_name TherapistData
extends Node

var trader_name: String = "Therapist"
var complete: bool = false
var TraderTasks:= [
	Tasks.tasks.Shortage,
	Tasks.tasks.Aq1,
	Tasks.tasks.Aq2,
	Tasks.tasks.Gasan1,
	Tasks.tasks.Gasan2,
	Tasks.tasks.Painkill,
	Tasks.tasks.Pharm,
	Tasks.tasks.DHistory,
	Tasks.tasks.Car,
	Tasks.tasks.Supply,
	Tasks.tasks.HCP1,
	Tasks.tasks.HCP2,
	Tasks.tasks.HCP3,
	Tasks.tasks.HCP4,
	Tasks.tasks.Athlete,
	Tasks.tasks.PClinic,
	Tasks.tasks.HCP5,
	Tasks.tasks.Wares,
	Tasks.tasks.Coll1,
	Tasks.tasks.Coll2,
	Tasks.tasks.Coll3,
	Tasks.tasks.Postman2,
	Tasks.tasks.Curiosity,
	Tasks.tasks.Crisis,
	Tasks.tasks.Seaside,
	Tasks.tasks.LostContact,
	Tasks.tasks.Trafficking
]

const TaskNames:= {
	Tasks.tasks.Shortage : "Shortage",
	Tasks.tasks.Aq1 : "Operation Aquarius - Part 1",
	Tasks.tasks.Aq2 : "Operation Aquarius - Part 2",
	Tasks.tasks.Gasan1 : "Sanitary Standards - Part 1",
	Tasks.tasks.Gasan2 : "Sanitary Standards - Part 2",
	Tasks.tasks.Painkill : "Painkiller",
	Tasks.tasks.Pharm : "Pharmacist",
	Tasks.tasks.DHistory : "Disease History",
	Tasks.tasks.Car : "Car Repair",
	Tasks.tasks.Supply : "Supply Plans",
	Tasks.tasks.HCP1 : "Health Care Privacy - Part 1",
	Tasks.tasks.HCP2 : "Health Care Privacy - Part 2",
	Tasks.tasks.HCP3 : "Health Care Privacy - Part 3",
	Tasks.tasks.HCP4 : "Health Care Privacy - Part 4",
	Tasks.tasks.Athlete : "Athlete",
	Tasks.tasks.PClinic : "Private Clinic",
	Tasks.tasks.HCP5 : "Health Care Privacy - Part 5",
	Tasks.tasks.Decontam : "Decontamination Service",
	Tasks.tasks.Wares : "General Wares",
	Tasks.tasks.Coll1 : "Colleagues - Part 1",
	Tasks.tasks.Coll2 : "Colleagues - Part 2",
	Tasks.tasks.Coll3 : "Colleagues - Part 3",
	Tasks.tasks.Postman2 : "Postman Pat - Part 2",
	Tasks.tasks.Curiosity : "Out of Curiosity",
	Tasks.tasks.Crisis : "Crisis",
	Tasks.tasks.Seaside : "Seaside Vacation",
	Tasks.tasks.LostContact : "Lost Contact",
	Tasks.tasks.Trafficking : "Drug Trafficking",
}

func run_check() -> void:
	pass
