extends KinematicBody2D
var speed = 500
var direction = Vector2.ZERO
signal projectile_hit
#var Projectile = load("res://EnemyProjectile.tscn")
var ticks = 0
signal spawned


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if Input.is_action_just_pressed("Shoot"):
		#enemy.target = player.global_position
		#print(enemy.target, "=", player.global_position, enemy.global_position)
		
	#	var projectile = Projectile.instance()
	#	var mouse_pos = get_viewport().get_mouse_position()
		
	#	projectile.position = position
	#	var dir1 = Vector2(mouse_pos.x, mouse_pos.y)
	#	var dir2 = Vector2(position)
	#	projectile.direction = Vector2(dir1.x-dir2.x, dir1.y-dir2.y).normalized()
	#	Projectiles.append(projectile)
	#	add_child(projectile)
	ticks += 1
	position.x += direction.x * speed * delta
	position.y += direction.y * speed * delta


func _on_Projectile_projectile_hit():
	queue_free()
	

#func arrow():
	#get_node("EnergyBall").hide()
	#get_node("Arrow").show()
	

func shift_collision_2():
	self.set_collision_layer(2)
	self.set_collision_mask(2)
	print(self.get_collision_layer(), self.get_collision_mask())
