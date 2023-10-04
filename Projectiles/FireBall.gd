extends Area2D
class_name FireBall


export (int) var speed = 10

var direction := Vector2.ZERO

onready var kil_timer = $KillTimer

func _ready():
	kil_timer.start()


func _physics_process(delta: float):
	if direction!= Vector2.ZERO:
		var velocity  = direction *speed
	
		global_position += velocity
	


func set_direction(direction: Vector2):
	self.direction = direction
	rotation = direction.angle()


func _on_KillTimer_timeout():
	queue_free()
