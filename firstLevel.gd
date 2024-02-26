extends Node2D
@export var roomScene:String = "res://RoomInterior.tscn"

@onready var firstLevel = $firstLevel
var room;

# Called when the node enters the scene tree for the first time.
func _ready():
	#firstLevel = get_node("/root/Level1Manager/firstLevel")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	

func suppressLevel():
	room = load(roomScene).instantiate()

	add_child(room)
	remove_child(firstLevel)
	
func restoreLevel():
	add_child(firstLevel)
	room.queue_free()
	
