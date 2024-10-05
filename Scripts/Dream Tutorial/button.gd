extends Node3D

signal pressed

@onready var Raycast_In = false

func _on_area_3d_area_entered(area: Area3D) -> void:
	Raycast_In = true

func _on_area_3d_area_exited(area: Area3D) -> void:
	Raycast_In = false

func _process(delta: float) -> void:
	
	if Raycast_In == true and Input.is_action_just_pressed("Left Click"):
		$AnimationPlayer.play("Press")
		pressed.emit()
