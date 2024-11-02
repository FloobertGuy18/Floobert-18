extends Node3D

@onready var Level_Name = "Main Lobby"

func _ready() -> void:
	$"Map/Cool Store/AnimationPlayer".play("TextAction_002")
