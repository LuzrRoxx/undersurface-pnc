extends Control

@onready var controlNode = self

func _process(delta):
	if Input.is_action_just_pressed("game_pause"):
		print("pause")
		controlNode.visible = !visible
	if controlNode.visible:
		get_tree().paused = true
	else:
		get_tree().paused = false
