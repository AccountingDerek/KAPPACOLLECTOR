extends Button
func _ready():
	connect("pressed", logic)

func logic():
	SaveData.reset()
