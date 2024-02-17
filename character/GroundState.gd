extends State

class_name GroundState
@export var jump_velocity : float = -150
@export var air_state : State

#velocity.y = jump_velocity

func state_input(event: InputEvent): 
	if (event.is_action_pressed("Jump")) : 
		jump()
		
func jump():
	character.velocity.y = jump_velocity
	next_state = air_state
