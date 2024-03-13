extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _on_OutOfBound_body_entered(body):
	if (body.name == "Player"):
		print("Player is out of bound!")
		$Player/AudioStreamPlayer2D.playing = true


func _on_OutOfBoundRestart_body_entered(body):
	if (body.name == "Player"):
		print("Player is out of bound!")
		get_tree().change_scene("res://scenes/Main.tscn")


func _on_AudioStreamPlayer2D_finished():
	$Player/AudioStreamPlayer2D.playing = true
