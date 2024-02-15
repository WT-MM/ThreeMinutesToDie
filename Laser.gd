extends CharacterBody2D


var speed = 400 # Adjust the speed as needed
var direction = Vector2(1, 0) # Direction the laser moves

func _physics_process(delta):
	velocity = direction * speed
	move_and_slide()
