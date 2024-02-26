extends Control

@export var scene_menu : PackedScene

func _ready() -> void:
	Global.health += 1
	Global.s += 1
	Global.energy = 0




func _on_retry_pressed():
	Global.health = 100
	Global.s = 0
	Global.m = 3
	#energy
	get_tree().change_scene_to_file("res://firstLevel.tscn")


func _on_main_menu_pressed():
	Global.health = 100
	Global.s = 0
	Global.m = 3
	#energy
	get_tree().change_scene_to_packed(scene_menu)


func _on_quit_game_pressed():
	get_tree().quit()
