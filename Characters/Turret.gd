extends Archer_Enemy
class_name turret
signal rocket

var proj_type

func _ready():
	speed = 0
	proj_type = 0


func _physics_process(delta):
	#var next_location = $NavigationAgent2D.get_next_location()
	#direction = (next_location - global_position).normalized()
	
	#update enemy sight target to player position. Note: You must
	# import player object for this to work, so it won't run by itself
	# without main. Also, you must have both objects be of the same type
	# KinematicBody2D for some reason
	var for_calc = player.global_transform.origin - self.global_transform.origin
	var dist = sqrt(for_calc.x * for_calc.x + for_calc.y * for_calc.y)
	var space = get_world_2d().direct_space_state
	var enemy_vision = space.intersect_ray(global_transform.origin,
							player.global_transform.origin, see_thru)
	
	if enemy_vision:
		#if enemy_vision.collider==player && can_spot:
		if enemy_vision.collider == player:
			if ((dist < 1000) && (can_fire)):
				#print(can_fire)
				$GunTimer.start()
				can_fire = false

				var fire_direction = (gunpoint.global_transform.origin - end_of_gun.global_transform.origin).normalized()

				if (proj_type == 0):
					var arrow = Projectile.instance()
					see_thru.append(arrow)
					emit_signal("shoot", arrow, global_position, fire_direction)
				elif (proj_type == 1):
					var Fireball = load("res://Projectiles/EnemyExplosive.tscn")
					var fireball_instance = Fireball.instance()
					emit_signal("rocket", fireball_instance, global_position, fire_direction)
	
	look_at(target)


func handle_hit():
	health -= 15
	$EnemyHurt.play()
	$DamageFlash.show()
	$Sprite.hide()
	$White_Timer.start()
	$ProgressBar.set_value(health)
	if health <= 0:
		queue_free()


func _on_White_Timer_timeout():
	$DamageFlash.hide()
	$Sprite.show()
	$White_Timer.stop()
