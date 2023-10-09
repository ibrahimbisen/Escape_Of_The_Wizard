extends KinematicBody2D
onready var animPlayer = $AnimationPlayer

func _physics_process(delta):
	animPlayer.play("test")

var health: int = 100




func handle_hit():
	health -= 20
	if health <= 0:
		queue_free()
