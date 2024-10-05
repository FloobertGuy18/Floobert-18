extends Node3D


func _on_button_pressed() -> void:
	$Map/Forcefield/LaserZap.play()
	$Map/Forcefield.position -= Vector3(0,50,0)
