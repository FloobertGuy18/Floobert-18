extends Node2D

#384
#324

func _ready() -> void:
	get_window().size = Vector2(0, 0)
	get_window().position = Vector2(DisplayServer.screen_get_size(1).x / 2,DisplayServer.screen_get_size(1).y)
	
	var Screen_Tween = create_tween().set_parallel(true)
	Screen_Tween.tween_property(get_window(), "position", Vector2i(576,200), 1).set_trans(Tween.TRANS_SINE)
	Screen_Tween.tween_property(get_window(), "size", Vector2i(768, 648), 1).set_trans(Tween.TRANS_SINE)

func _process(delta: float) -> void:
	print(get_window().position)
