extends CanvasLayer

var currItem = 0
var select = 0

@export var required_amount_to_win = 10

func _on_close_pressed():
	get_node("AnimationPlayer").play("TransOut")
	visible = false
	get_tree().paused = false

func _on_go_pressed():
	var total_energy = 0
	for item_id in Global.inventory:
		var item = Global.inventory[item_id]
		if item["Name"] == "Energy":
			total_energy += item["Amount"]
		
		if total_energy >= required_amount_to_win:
			 # The game is won, handle winning logic here
			print("You've won the game!")
			# Maybe trigger a winning scene transition or display a message
		else:
			# Not enough energy, continue playing or give feedback to the player
			print("You need more energy to win!")
	
	
