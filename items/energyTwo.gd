extends Node

var player_in_area = false

func _ready():
	pass

func _process(delta):
	if(player_in_area):
		if(Input.is_action_just_pressed("e")):
			get_parent().queue_free()

var energy = preload("res://items/energy_collectable.tscn")


func _on_area_2d_body_entered(body):
	if(body.has_method("player")):
		player_in_area = true


func _on_area_2d_body_exited(body):
	if(body.has_method("player")):
		player_in_area = false

