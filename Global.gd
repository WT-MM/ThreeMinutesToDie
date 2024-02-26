extends Node

var energy = 9
var health = 80
var time_out : bool = false
var m = 100
var s = 100

func time_out_process():
	if(m == 0 && s == 0): 
		time_out = true

func game_over():
	if(health == 0 || time_out == true):
		pass

func _process(delta):
	if(health > 100):
		health = 100

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
