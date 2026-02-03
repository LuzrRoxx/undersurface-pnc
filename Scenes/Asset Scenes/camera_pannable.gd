extends Camera2D

@export var rightLimit = 0.0
@export var leftLimit = 0.0
@export var speed = 25.0

@onready var rightArea: Area2D = $rightArea
@onready var leftArea: Area2D = $leftArea

var moving_left: bool = false
var moving_right: bool = false

@onready var leftCollision = %leftArea/John
@onready var rightCollision = %rightArea/CollisionShape2D

func _ready():
	pass

func _process(delta):
	var viewportSize = get_viewport().get_visible_rect().size
	var center = viewportSize / 2
	var mousePos = get_viewport().get_mouse_position()
	var pos = global_position
	var distance = center.distance_to(mousePos)
	var maxDistance = center.length()
	var norDistance = distance / maxDistance
	var mulDistance = norDistance * 1.75
	
	if moving_right:
		pos.x += speed * mulDistance * delta
		if pos.x >= rightLimit:
			pos.x = rightLimit
			moving_right = false
		
	elif moving_left:
		pos.x -= speed * mulDistance * delta
		if pos.x <= leftLimit:
			pos.x = leftLimit
			moving_left = false

	global_position = pos
		
func _on_right_area_mouse_entered() -> void:
	if global_position.x < rightLimit:
		print("rightentered")
		moving_right = true
func _on_right_area_mouse_exited() -> void:
	if global_position.x < rightLimit:
		moving_right = false
func _on_left_area_mouse_entered() -> void:
	if global_position.x > leftLimit:
		moving_left = true
func _on_left_area_mouse_exited() -> void:
	if global_position.x > leftLimit:
		moving_left = false
