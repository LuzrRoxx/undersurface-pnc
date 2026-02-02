extends Camera2D

@export var rightLimit = 0.0
@export var leftLimit = 0.0
@export var speed = 25.0

@onready var rightArea: Area2D = $rightArea
@onready var leftArea: Area2D = $leftArea

var moving_left: bool = false
var moving_right: bool = false


func _on_right_area_mouse_entered() -> void:
	if global_position.x < rightLimit:
		moving_right = true
func _on_right_area_mouse_exited() -> void:
	if global_position.x < rightLimit:
		moving_left = false
func _on_left_area_mouse_entered() -> void:
	if global_position.x < leftLimit:
		moving_right = true
func _on_left_area_mouse_exited() -> void:
	if global_position.x < leftLimit:
		moving_left = false

func _process(delta):
	var pos = global_position
	
	if moving_right:
		pos.x += speed * delta
		if pos.x >= rightLimit:
			pos.x = rightLimit
			moving_right = false
			rightArea.disabled = true
		leftArea.disabled
		
	elif moving_left:
		pos.x -= speed * delta
		if pos.x <= leftLimit:
			pos.x = leftLimit
			moving_left = false
			leftArea.disabled = true
		rightArea.disabled
		
