extends Node2D

func _on_line_edit_text_submitted(new_text: String) -> void:
	if new_text == "IBV1":
		get_tree().change_scene_to_file("res://Scenes/Intro/Intro.scn")