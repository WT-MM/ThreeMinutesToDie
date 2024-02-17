extends Node

class_name CharacterStateMachine

var states : Array[State]
@export var current_state: State 
@export var character : CharacterBody2D

func _ready():
	for child in get_children():
		if (child is State):
			states.append(child)
			
			child.character = character
			
		else: 
			push_warning("Child" + child.name + "is not a State for CharacterStateMachine")

func _physics_process(delta):
	if(current_state.next_state != null):
		switch_states(current_state.next_state)


func check_if_can_move():
	return current_state.can_move
	
func switch_states(new_state : State):
	current_state = new_state

