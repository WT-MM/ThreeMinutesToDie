extends Area2D

var door = null
var levelManager;
# Called when the node enters the scene tree for the first time.
func _ready():
	connect("area_entered", Callable(self, "_on_area_entered"))
	connect("area_exited", Callable(self, "_on_area_exited"))
	levelManager = get_node("/root/Level1Manager")

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
				levelManager.suppressLevel()
				#get_tree().change_scene_to_file("res://RoomInterior.tscn")
				#Change scene
	
