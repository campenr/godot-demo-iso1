class_name Projectile

extends Area2D

var velocity: Vector2

var SPEED = 100


func _ready():
	velocity = get_local_mouse_position().normalized()
	


func _process(delta):
	position = position + velocity * delta * SPEED


func _on_area_entered(area):
	area.queue_free()
	queue_free()
