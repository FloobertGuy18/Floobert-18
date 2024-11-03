extends Node3D

@onready var Level_Name = "Main Lobby"

func _ready() -> void:
	$"Map/Cool Store/AnimationPlayer".play("TextAction_002")
	get_tree().get_first_node_in_group("Player").Locked = true
	$"Intro Cam".current = true
	$AnimationPlayer.play("Animation Player")
	await $AnimationPlayer.animation_finished
	$Flerbert.queue_free()
	get_tree().get_first_node_in_group("Player").Locked = false
	$"Intro Cam".queue_free()
