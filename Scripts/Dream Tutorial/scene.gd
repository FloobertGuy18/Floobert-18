extends Node3D

GlobalVars.Level_Name = "Dream Sequence"

func _on_button_pressed() -> void:
	$Map/Forcefield/LaserZap.play()
	$Map/Forcefield.position -= Vector3(0,50,0)


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body == $"Base Player":
		get_tree().change_scene_to_file("res://Scenes/Dream Tutorial/im_dead.tscn")
