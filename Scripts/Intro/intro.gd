extends Node2D

func _ready() -> void:
	get_window().size = Vector2(0, 0)
	get_window().position = Vector2(DisplayServer.screen_get_size(1).x / 2,DisplayServer.screen_get_size(1).y)
	
	var Screen_Tween = create_tween().set_parallel(true)
	Screen_Tween.tween_property(get_window(), "position", Vector2i(576,200), 1).set_trans(Tween.TRANS_SINE)
	Screen_Tween.tween_property(get_window(), "size", Vector2i(768, 648), 1).set_trans(Tween.TRANS_SINE)
	
	await get_tree().create_timer(2).timeout
	
	$NativeFileDialog.show()
	
func _on_native_file_dialog_file_selected(path: String) -> void:
	var load_file = FileAccess.open(path, FileAccess.READ)
	
	if load_file.get_line() == str(19288):
		change_scene()

func change_scene():
	
	$Sounds/Intro.play()
	$Label.text = "LOADING .VEGA"
	
	await get_tree().create_timer(4).timeout
	$Label.text = "LOADED"
	$Sounds/Intro.stop()
	$Sounds/MenuButton.play()
	
	await get_tree().create_timer(1).timeout
	
	$Fade/AnimationPlayer.play("Fade")
	await $Fade/AnimationPlayer.animation_finished
	
	await get_tree().create_timer(1).timeout
	
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	
	await get_tree().create_timer(2).timeout
	
