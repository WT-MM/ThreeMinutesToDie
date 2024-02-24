extends Label


func _ready():
	pass

func _process(delta):
	text = "Energy: " + str(Global.energy)
