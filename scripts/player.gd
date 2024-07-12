extends CharacterBody2D


const SPEED = 100

var target: Vector2


func _physics_process(_delta):
	if position.distance_to(target) < 1:
		velocity = Vector2(0,0)
	else:
		move_and_slide()


func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			target = get_global_mouse_position()
			velocity = (target - position).normalized() * SPEED
