extends Button


func _on_pressed() -> void:
	pass # Replace with function body.

func _process(delta):
	if button_pressed:
		get_tree().change_scene_to_file("res://Scenes/Scene1Debug.tscn")
