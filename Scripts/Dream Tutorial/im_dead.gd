extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await $VideoStreamPlayer.finished
	get_tree().change_scene_to_file("res://Scenes/Dream Tutorial/Scene.scn")
