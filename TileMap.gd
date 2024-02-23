extends TileMap

var moisture = FastNoiseLite.new()
var temperature = FastNoiseLite.new()
var altitude = FastNoiseLite.new()

var width = 16
var height = 16
var cell_size = 16

var ground_y = 0

@onready var player_node = get_node("../player")

func _ready():
	moisture.seed = randi()
	temperature.seed = randi()
	altitude.seed = randi();
	generate_ground(-100,100)
	
func place3x3(bottomLeftReal, bottomLeftAtlas, tileID, layerID):
	
	place2x2(bottomLeftReal, bottomLeftAtlas, tileID, layerID);
	bottomLeftReal[1]-=2
	bottomLeftAtlas[1]-=2
	set_cell(layerID, bottomLeftReal, tileID, bottomLeftAtlas);
	bottomLeftReal[0]+=1
	bottomLeftAtlas[0]+=1
	set_cell(layerID, bottomLeftReal, tileID, bottomLeftAtlas);
	
func place2x2(bottomLeftReal, bottomLeftAtlas, tileID, layerID):
	#Bottom left
	set_cell(layerID, bottomLeftReal, tileID, bottomLeftAtlas)
	bottomLeftReal[0]+=1;
	bottomLeftAtlas[0]+=1;
	#Bottom right
	set_cell(layerID, bottomLeftReal, tileID, bottomLeftAtlas)
	bottomLeftReal[1]-=1;
	bottomLeftAtlas[1]-=1;
	#Top right
	set_cell(layerID, bottomLeftReal, tileID, bottomLeftAtlas)
	bottomLeftReal[0]-=1;
	bottomLeftAtlas[0]-=1;
	#Top left
	set_cell(layerID, bottomLeftReal, tileID, bottomLeftAtlas)

func generate_ground(start, end):
	for x in range(start, end):
		#Actual ground
		set_cell(0,Vector2i(x, ground_y), 0, Vector2i(10, 7))
		set_cell(0,Vector2i(x, ground_y+1), 0, Vector2i(10, 8))
		set_cell(0,Vector2i(x, ground_y+2), 0, Vector2i(10, 9))
		
		#Filling in below the ground
		for i in range(ground_y+2, ground_y+5):
			set_cell(0,Vector2i(x, i), 0, Vector2i(9, 13))
			
		#Decorative (not dependent on dist)
		if(abs(x) > 5): 
			var moisture_level = moisture.get_noise_1d(x)
						#Generate rooms
			if randf() < 0.07: 
				place3x3(Vector2(x, ground_y), Vector2i(0,12), 3, 2)
				add_door_at_position(Vector2i(x, ground_y))
			elif randf() < 0.04:  #Skull - just want a few scattered around
				place2x2(Vector2i(x, ground_y), Vector2i(4,5), 1, 1)

func add_door_at_position(position: Vector2):
	var door_area = Area2D.new()
	door_area.name = "DoorArea"
	var collision_shape = CollisionShape2D.new()
	var shape = RectangleShape2D.new()
	shape.extents = Vector2(16, 32)  # Adjust the size to fit your door's dimensions
	collision_shape.shape = shape
	door_area.add_child(collision_shape)
	
	# Optionally, set the position of the Area2D to match the door tile's position
	# This might need adjustment depending on your tile size and how you've setup your TileMap
	door_area.position = Vector2(position.x * cell_size, 308)
	print(door_area.position)
	
	# Connect the Area2D signals for interaction
	door_area.connect("body_entered",Callable($TileMap, "_on_DoorArea_body_entered"))
	door_area.connect("body_exited", Callable($TileMap, "_on_DoorArea_body_exited"))
	
	# Add the Area2D to the TileMap or another parent node
	add_child(door_area)
	
func _on_DoorArea_body_entered(body):
	print("ENTERED")
	if body.name == "Player":
		# Logic when the player is near enough to interact with the door
		print("Player can interact with the door")

func _on_DoorArea_body_exited(body):
	if body.name == "Player":
		# Logic for when the player leaves the door's interaction area
		print("Player left the door's interaction area")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#generate_chunk(player_node.position)
	pass

#10, 7 to 10, 9
