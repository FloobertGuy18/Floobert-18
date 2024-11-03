extends Node3D

signal fadeout

@onready var Area_Entered = false

@onready var Chat_Box = preload("res://Scenes/Dream Tutorial/dialogue.res").instantiate()

func _process(delta: float) -> void:
	
	$Sprite3D.visible = Area_Entered
	
	
	if Area_Entered and Input.is_action_pressed("Interact"):
		Area_Entered = false
		get_tree().get_first_node_in_group("Player").Locked = true
		get_tree().get_first_node_in_group("Player").camera_look_at(self.position + Vector3(0, 0.5, 0))
		Chat_Box.Talk_Name = "Floobert"
		Chat_Box.Text_Array = ["Hey whats up.", "You're dreaming by the way", "...", "You should wake up now."]
		add_child(Chat_Box)
		await Chat_Box.fin
		$"../../Sounds/Theme".stop()
		$"../../VHS/AnimationPlayer".play("Fade")
		await $"../../VHS/AnimationPlayer".animation_finished
		get_tree().change_scene_to_file("res://Scenes/Main Lobby/main_lobby.scn")


func _on_area_3d_body_entered(body: Node3D) -> void:
	if "Player" in body.to_string():
		Area_Entered = true


func _on_area_3d_body_exited(body: Node3D) -> void:
	if "Player" in body.to_string():
		Area_Entered = false
