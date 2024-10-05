extends Node3D



func _on_area_3d_body_entered(body: Node3D) -> void:
	
	if "Player" in body.to_string():
		$LaserZap.play()
		body.velocity.y = 15
