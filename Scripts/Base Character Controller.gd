extends CharacterBody3D 
class_name Player

@export_category("Stats")
@export var Jump_Velocity = 4.5
@export var Speed = 5.0
@export var Sensitivity = 0.025

@onready var Neck = $Neck
@onready var Camera = $Neck/Camera3D

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _input(event: InputEvent) -> void:
	
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	if event is InputEventMouseMotion:
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			Neck.rotate_y(-event.relative.x * Sensitivity)
			Camera.rotate_x(-event.relative.y * Sensitivity)
			Camera.rotation.x = clamp(Camera.rotation.x, deg_to_rad(-90), deg_to_rad(90))

func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = Jump_Velocity
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	var Input_Direction = Input.get_vector("Strafe Left", "Strafe Right", "Forward", "Backward")
	
	var Direction = (Neck.transform.basis * Vector3(Input_Direction.x, 0, Input_Direction.y)).normalized()
	
	if Direction:
		velocity.x = move_toward(velocity.x, Direction.x * Speed, 0.5)
		velocity.z = move_toward(velocity.z, Direction.z * Speed, 0.5)
	else:
		velocity.x = move_toward(velocity.x, 0, 0.5)
		velocity.z = move_toward(velocity.z, 0, 0.5)
	
	move_and_slide()
