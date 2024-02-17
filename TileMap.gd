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

func generate_ground(start, end):
	for x in range(start, end):
		set_cell(0,Vector2i(x, ground_y), 0, Vector2i(10, 7))
		set_cell(0,Vector2i(x, ground_y+1), 0, Vector2i(10, 8))
		set_cell(0,Vector2i(x, ground_y+2), 0, Vector2i(10, 9))
		for i in range(ground_y+2, ground_y+5):
			set_cell(0,Vector2i(x, i), 0, Vector2i(9, 13))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#generate_chunk(player_node.position)
	pass

	
func generate_chunk(position):
	var tile_pos = local_to_map(position)
	for x in range(width):
		for y in range(height):
			var moist = moisture.get_noise_2d(tile_pos.x + x, tile_pos.y + y)
			var temp = temperature.get_noise_2d(tile_pos.x + x, tile_pos.y + y)
			var alt = altitude.get_noise_2d(tile_pos.x + x, tile_pos.y + y)
			set_cell(0, Vector2i(tile_pos.x+x, tile_pos.y+y), 0, Vector2i(10,7))

#10, 7 to 10, 9
