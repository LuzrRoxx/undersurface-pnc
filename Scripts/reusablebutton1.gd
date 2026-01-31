extends Area2D
var mouse_inside = false
@export var target_scene: String = ""

func _on_mouse_entered() -> void:
	mouse_inside = true
	print("entered")
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	
func _on_mouse_exited() -> void:
	mouse_inside = false
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	
func _process(delta):
	if mouse_inside and Input.is_action_just_pressed("game_click"):
		print("clicked")
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)
		if target_scene != "":
			get_tree().change_scene_to_file(target_scene)

func set_target_scene(scene_path: String) -> void:
	target_scene = scene_path
