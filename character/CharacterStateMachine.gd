extends Node

class_name CharacterStateMachine

var states : Array[State]
@export var current_state: State 

func _ready():
	for child in get_children():
		if (child is State):
			states.append(child)
			
			
		else: 
			push_warning("Child" + child.name + "is not a State for CharacterStateMachine")
			

func check_if_can_move():
	return current_state.can_move

