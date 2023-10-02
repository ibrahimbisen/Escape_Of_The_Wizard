extends KinematicBody2D
var speed = 4
var velocity = Vector2.ZERO

var Projectile = load("res://projectile.tscn")
signal spawned


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Shoot"):
		var projectile = Projectile.instance()
		var mouse_pos = get_global_mouse_position()
		
		projectile.position = global_transform.origin
		var dir1 = Vector2(mouse_pos.x, mouse_pos.y)
		var dir2 = Vector2(position)
		projectile.direction = Vector2(dir1.x-dir2.x, dir1.y-dir2.y).normalized()
		emit_signal("spawned", projectile)

	if Input.is_action_pressed("move_down"):
		velocity.y += 1
		#camera.position.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		#camera.position.y -= 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		#camera.position.x -= 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		#camera.position.x += 1
	velocity = velocity.normalized() * speed
	
	position += velocity
	velocity = Vector2.ZERO
	
	
	
	
	# This part below is for it fallow the mouse it is temp.
	
