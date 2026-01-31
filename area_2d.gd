extends Area2D

func _ready():
	# Connect the mouse enter and exit signals
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func _on_mouse_entered():
	# Change cursor to pointing hand (like a hyperlink)
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

func _on_mouse_exited():
	# Change back to normal arrow
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
