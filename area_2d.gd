extends Area2D
var mouse_inside = false

func _on_mouse_entered() -> void:
	mouse_inside = true
	print("entered")
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	
func _on_mouse_exited() -> void:
	mouse_inside = false
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	
func _process(delta):
	if mouse_inside == true:
		print("inside")
		if Input.is_action_just_pressed("game_click"):
			pass #do x
