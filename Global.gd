extends Node

var energy = 9
var health = 80

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
