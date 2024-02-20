class_name Database
extends Node

func _ready():
	Utility.update.connect(run_check)

func run_check():
	pass
