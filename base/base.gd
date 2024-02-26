extends Area2D

@onready var info_label: Label = $Label
var player_in_area = false  # Flag to track whether the player is in the area

# Called when the node enters the scene tree for the first time.
func _ready():
	info_label.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_in_area and Input.is_action_just_pressed("Interact"):
		get_tree().paused = true
		get_node("baseMenu").visible = true
		get_node("baseMenu/AnimationPlayer").play("TransIn")

func _on_body_entered(body):
	if body.name == "player":
		player_in_area = true
		info_label.visible = true

func _on_body_exited(body):
	if body.name == "player":
		player_in_area = false
		info_label.visible = false
