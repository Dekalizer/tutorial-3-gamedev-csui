extends Area2D

func _on_OutOfBound_body_entered(body):
	if (body.name == "Player"):
		print("Player is out of bound!")
		$"../AudioStreamPlayer2D".playing = true
