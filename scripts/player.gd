extends CharacterBody2D


const SPEED = 100

var target: Vector2
var projectile_attack_scene
var area_attack_scene

@onready var sprite_2d = $Sprite2D

func _ready():
	projectile_attack_scene = load("res://scenes/projectile_attack.tscn")
	area_attack_scene = load("res://scenes/area_attack.tscn")


func _process(_delta):
	if velocity.x > 0:
		sprite_2d.flip_h = true
	elif velocity.x < 0:
		sprite_2d.flip_h = false


func _physics_process(_delta):
	if position.distance_to(target) < 1:
		velocity = Vector2(0,0)
	else:
		move_and_slide()


func _input(event):
	if not event.is_pressed():
			return

	if event is InputEventMouseButton:
		if event.button_index == 1:
			move_to_point()
		elif event.button_index == 2:
			attack_projectile()
		
	if event is InputEventKey:
		if event.keycode == 49:
			attack_area()


func move_to_point():
	target = get_global_mouse_position()
	velocity = (target - position).normalized() * SPEED


func attack_projectile():
	var projectile_attack = projectile_attack_scene.instantiate()
	projectile_attack.set_position(position)
	owner.add_child(projectile_attack)


func attack_area():
	var area_attack = area_attack_scene.instantiate()
	area_attack.set_position(position)
	owner.add_child(area_attack)
