extends Node

var energy = 9
var health = 80
var time_out = false
var m = 100
var s = 100
var game_over_state = false

var player

func store_player(player):
	player = player

func _process(delta):
	if(health > 100):
		health = 100
	
	if(Global.m == 0 && Global.s == 0): 
		Global.time_out = true
	else:
		Global.time_out = false
	
	if(health == 0 || time_out == true):
		game_over_state = true
	else:
		game_over_state = false

var items = {
	0: {
		"Name": "Energy",
		"Des": "Energy!",
		"Value": 1
	}
}

var inventory = {
	0: {
		"Name": "Energy",
		"Des": "Energy!",
		"Value": 1,
		"Amount": 10
	}
}
