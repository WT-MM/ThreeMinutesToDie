extends Node


func _on_bounds_body_entered(body):
	if(body.name == "enemy"):
		body.change_state()
		
