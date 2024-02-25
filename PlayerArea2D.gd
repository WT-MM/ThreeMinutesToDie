extends Area2D

var door = null
# Called when the node enters the scene tree for the first time.
func _ready():
	connect("area_entered", Callable(self, "_on_area_entered"))
	connect("area_exited", Callable(self, "_on_area_exited"))


func _on_area_entered(area):
	door = area
	
func _on_area_exited(area):
	door = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		if Input.is_action_just_pressed("Enter"):
			if(door):
				#print("Changing scene")
				print("OBJECT POSITION: " + str(door.position) + "   NAME: " + 
				door.name)
				pass
				#Change scene
	
