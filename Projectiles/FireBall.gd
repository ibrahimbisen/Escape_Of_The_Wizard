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


# as well as body entered we also need to do area entered from the node
#class of the fireball scene because body entered is only for 2d knimeatic bodies
#but area entered is also for collisisons with wall and etc

func _on_FireBall_body_entered(body):
	if body.has_method("handle_hit"):
		body.handle_hit()
	queue_free()
