extends Node2D

@export var Name : String
@export var Text_Array : Array[String] = ["Text1"]

func _ready() -> void:
	$"Name Text".text = Name
	$AnimationPlayer.play("Intro")
	await $AnimationPlayer.animation_finished
	
	for t in Text_Array.size():
		print(t)
		read_out_text(Text_Array[t])

func read_out_text(Text: String):
	var text_list = create_tween()
	$Text.text = Text
	text_list.tween_property($"Text", "visible_ratio", 1, 2)
	await text_list.finished
