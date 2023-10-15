extends Area2D
class_name FireBall
signal gone

export (int) var speed = 30

var direction := Vector2.ZERO
var shotty = false

onready var kil_timer = $KillTimer

func _ready():
	if shotty:
		kil_timer.wait_time = 0.4
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
	emit_signal("gone")


# as well as body entered we also need to do area entered from the node
#class of the fireball scene because body entered is only for 2d knimeatic bodies
#but area entered is also for collisisons with wall and etc

func _on_FireBall_body_entered(body):
	if body.has_method("handle_hit"):
		body.handle_hit()
		queue_free()
		emit_signal("gone")
		
