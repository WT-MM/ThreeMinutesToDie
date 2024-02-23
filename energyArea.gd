extends Area2D

# Define a signal that will be emitted when the item is picked up.
signal item_picked_up(item)

func _ready():
	add_to_group("PickupItems")
	# Connect the 'body_entered' signal to a function to detect when the player enters.
	#connect("body_entered", Callable(self, "_on_body_entered"))

func pickup():
	self.get_parent().queue_free()

#func _on_body_entered(body):
	## Check if the colliding body is the player.
	#if body.is_in_group("Player"):  # Make sure your player is in the 'Player' group.
		#emit_signal("item_picked_up", self)
		#self.get_parent().queue_free()
