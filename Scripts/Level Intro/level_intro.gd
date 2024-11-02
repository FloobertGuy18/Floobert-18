extends CanvasLayer

@export_category("Colors")
@export var Right_Strand_Color : Color
@export var Lower_Strand_Color : Color

@export_category("Stats")
@export var Level_Name = ""

func _ready():
	$Right.self_modulate = Right_Strand_Color
	$Lower.self_modulate = Lower_Strand_Color
	$"Level Name".text = Level_Name
	$Animation.play("Half Open")
	await $Animation.animation_finished
	$LevelIntroJingle.play()
	await get_tree().create_timer(3).timeout
	$Animation.play("Full Open")
	await $Animation.animation_finished
	await queue_free()
