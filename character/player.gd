extends CharacterBody2D

class_name Player

@export var speed : float =  500 #150


@onready var sprite : Sprite2D = $Sprite2D
@onready var animation_tree : AnimationTree = $AnimationTree
@onready var state_machine : CharacterStateMachine = $characterStateMachine


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction: Vector2 = Vector2.ZERO

var playerPos = Vector2();
var playerWorldPos = Vector2();

signal facing_direction_changed(facing_right: bool)

@onready var item_pickup_area : Area2D = $ItemPickUpArea

func _process(delta):
	playerPos = self.position
	#print(playerPos)
	
func _ready():
	add_to_group("Player")
	animation_tree.active = true

func _on_area_enter(area):
	if area.has_method("collect"):
		area.collect()


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		pass 
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_vector("Left", "Right", "Up", "Down")
	
	
	if direction.x != 0 && state_machine.check_if_can_move():
		velocity.x = direction.x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		
	move_and_slide()
	update_animation_parameters()
	update_facing_direction()

func update_animation_parameters():
	animation_tree.set("parameters/move/blend_position", direction.x)

func update_facing_direction():
	if direction.x > 0:
		sprite.flip_h = false
	elif direction.x < 0:
		sprite.flip_h = true
		
	
	emit_signal("facing_direction_changed", !sprite.flip_h)

func player():
	pass

