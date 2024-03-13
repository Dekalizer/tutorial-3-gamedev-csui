extends Area2D

onready var player = get_tree().root.get_child(0).get_node("Player")

func _on_Coin_body_entered(body):
	if body.name == "Player":
		player.get_node("coinmp3").play(0.4)
		queue_free()
