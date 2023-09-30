extends KinematicBody2D
var speed = 500
var direction = Vector2.ZERO
signal projectile_hit
var ticks = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ticks += 1
	position.x += direction.x * speed * delta
	position.y += direction.y * speed * delta


func _on_Projectile_projectile_hit():
	queue_free()
