extends Node3D



func _on_area_3d_body_entered(body: Node3D) -> void:
	get_tree().get_first_node_in_group("Player").Locked = true
	$Camera3D.current = true
	$AnimationPlayer2.play("Fall")
	await $AnimationPlayer2.animation_finished
	get_tree().change_scene_to_file("res://Scenes/Inside Threatre/demo over.tscn")
