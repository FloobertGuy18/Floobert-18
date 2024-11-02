extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var range = round(randf_range(0,1))
	print(range)
	if range >= 1:
		$AnimationPlayer.play("loop 2")
	else:
		$AnimationPlayer.play("loop")
