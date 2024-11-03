extends Node3D


@onready var Area_Entered = false

func _process(delta: float) -> void:
	
	$Sprite3D.visible = Area_Entered
	
	
	if Area_Entered and Input.is_action_pressed("Interact"):
		Area_Entered = false
		get_tree().get_first_node_in_group("Player").Locked = true
		get_tree().get_first_node_in_group("Player").camera_look_at(self.position + Vector3(0, 0.5, 0))
		
		$AnimationPlayer.play("Fade")
		await $AnimationPlayer.animation_finished
		get_tree().change_scene_to_file("res://Scenes/Inside Threatre/2d section.scn")


func _on_area_3d_body_entered(body: Node3D) -> void:
	if "Player" in body.to_string():
		Area_Entered = true


func _on_area_3d_body_exited(body: Node3D) -> void:
	if "Player" in body.to_string():
		Area_Entered = false
