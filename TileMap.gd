extends TileMap

var moisture = FastNoiseLite.new()
var temperature = FastNoiseLite.new()
var altitude = FastNoiseLite.new()

var width = 16
var height = 16

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
				place3x3(Vector2i(x, ground_y), Vector2i(0,12), 3, 2)
			elif randf() < 0.04:  #Skull - just want a few scattered around
				place2x2(Vector2i(x, ground_y), Vector2i(4,5), 1, 1)

			

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#generate_chunk(player_node.position)
	pass

#10, 7 to 10, 9
