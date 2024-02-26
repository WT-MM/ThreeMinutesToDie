extends Node2D
@export var roomScene:String = "res://RoomInterior.tscn"

@onready var firstLevel = $firstLevel
var room;

# Called when the node enters the scene tree for the first time.
func _ready():
	#firstLevel = get_node("/root/Level1Manager/firstLevel")
	Global.store_player(get_node("/root/Level1Manager/firstLevel/player"))
	Global.health = 100
	#Global.energy
	#time?

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	

func suppressLevel():
	room = load(roomScene).instantiate()

	add_child(room)
	remove_child(firstLevel)
	add_child(Global.player)
	
func restoreLevel():
	remove_child(Global.player)
	add_child(firstLevel)
	room.queue_free()
	
