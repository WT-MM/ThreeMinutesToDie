extends Area2D


func _on_body_entered(body):
	if(body.name == "player"):
		var tween = create_tween()
		Global.energy += 1
		
		tween.tween_property(self, "position", position + Vector2(0,-30), 0.3)
		
		tween.tween_property(self, "modulate:a", 0.0, 0.3)
		
		tween.tween_callback(self.queue_free)

