extends CharacterBody2D


const SPEED = 100

var target: Vector2
var projectile_scene


func _ready():
	projectile_scene = load("res://scenes/projectile.tscn")


func _physics_process(_delta):
	if position.distance_to(target) < 1:
		velocity = Vector2(0,0)
	else:
		move_and_slide()


func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			move_to_point()
		if event.is_pressed() and event.button_index == 2:
			attack_projectile()


func move_to_point():
	target = get_global_mouse_position()
	velocity = (target - position).normalized() * SPEED


func attack_projectile():
	var projectile = projectile_scene.instantiate()
	projectile.set_position(position)
	owner.add_child(projectile)
