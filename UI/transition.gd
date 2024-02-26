extends Control

class_name transitioner 
@export var scene_switch_anim : String = "fade_out"
@export var scene_to_load : PackedScene

@onready var animation_text : TextureRect = $TextureRect

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_text.visible = false
	

func _process(delta):
	if(Global.time_out == true):
		get_node("AnimationPlayer").play("fade_out")



func _on_animation_player_animation_finished(anim_name):
	if(anim_name == scene_switch_anim && scene_to_load != null):
		get_tree().change_scene_to_packed(scene_to_load)
