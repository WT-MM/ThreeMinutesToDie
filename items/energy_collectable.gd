extends StaticBody2D

func _ready():
	collectEnergy()

func collectEnergy():
	print("+1 energy")
	queue_free()
