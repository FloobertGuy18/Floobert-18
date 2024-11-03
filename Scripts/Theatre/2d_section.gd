extends Node2D

func _ready() -> void:
	$_/AnimationPlayer2.play("new_animation")

func _on_area_2d_body_entered(body: Node2D) -> void:
	$Camera2D.enabled = false
	$CharacterBody2D/Camera2D.enabled = true
	body.position = Vector2(0,0)


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	$Camera2D.enabled = false
	$CharacterBody2D/Camera2D.enabled = true
	$AnimationPlayer.play("speech")
	$_/Label.text = "HELLO!"
	await get_tree().create_timer(2).timeout
	$AnimationPlayer.play("speech")
	$_/Label.text = "ITS BEEN SO LONG!"
	await get_tree().create_timer(2).timeout
	$AnimationPlayer.play("speech")
	$_/Label.text = "FLOOBERT?"
	await get_tree().create_timer(2).timeout
	$AnimationPlayer.play("speech")
	$_/Label.text = "YENDUS HAS HIM!"
	await get_tree().create_timer(1.5).timeout
	$AnimationPlayer.play("speech")
	$_/Label.text = "WAIT DONT LEAVE ME!"
	await get_tree().create_timer(1.2).timeout
	get_tree().change_scene_to_file("res://Scenes/Inside Threatre/scene 2.tscn")
	
func _on_area_2d_3_body_entered(body: Node2D) -> void:
	$Camera2D.enabled = true
	$CharacterBody2D/Camera2D.enabled = false
