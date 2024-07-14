class_name AreaAttack

extends Area2D

var SPEED = 0.5
var SCALE = 2.0

@onready var attack_timer = $AttackTimer

func _ready():
	attack_timer.start()


func _on_timer_timeout():
	queue_free()


func _on_body_entered(body):
	body.queue_free()
