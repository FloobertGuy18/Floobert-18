extends RigidBody3D

func _ready() -> void:
	linear_velocity = Vector3(randi_range(-5,5),randi_range(-5,5), randi_range(-5,5))
