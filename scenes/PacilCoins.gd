extends Area2D

func _on_PacilCoin_body_entered(body):
	if (body.name == "Player"):
		var player = body.get_parent().get_node("Player")
		if player:
			var player_script = player.get_script()
			player_script.score += 1
			player_script.update_hud()
		queue_free()
