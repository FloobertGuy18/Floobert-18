extends CanvasLayer

signal pressedInteract

signal fin

@export var Talk_Name : String
@export var Text_Array : Array

func _ready() -> void:
	$"Name Text".text = Talk_Name
	$AnimationPlayer.play("Intro")
	await $AnimationPlayer.animation_finished
	
	for t in Text_Array.size():
		
		read_out_text(Text_Array[t])
		
		await pressedInteract
		print(1)
	
	fin.emit()
	print("free")
	$AnimationPlayer.play("Outro")
	await $AnimationPlayer.animation_finished
	queue_free()

func read_out_text(Text: String):
	$"Text".visible_ratio = 0
	var text_list = create_tween()
	$Text.text = Text
	text_list.tween_property($"Text", "visible_ratio", 1, 1)
	await text_list.finished

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Interact"):
		pressedInteract.emit()
