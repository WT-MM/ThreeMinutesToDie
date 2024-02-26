extends Label

@onready var timer : Timer = $Timer
# Called when the node enters the scene tree for the first time.

@export var s = 0
@export var m = 3

func _ready():
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (s < 0 ):
		m -= 1
		s = 59
	
	
	
	text = "Time: " + (str(m) + ":" + str(s))
	
	Global.m = m
	Global.s = s


func _on_timer_timeout():
	s -= 1
