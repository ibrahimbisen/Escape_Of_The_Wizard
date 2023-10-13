extends Enemy
class_name Archer_Enemy

onready var end_of_gun = $EndofGun
onready var gunpoint = $GunDirection

#export (int, LAYERS_2D_NAVIGATION) var nav_layer = 1
##onready var nav = $NavigationAgent2D
#var target_reached = true
#onready var init_location = self.position
#onready var next_location = self.position
#var can_spot = true

var can_fire = true
var Projectile = load("res://Projectiles/EnemyShot.tscn")
#var Projectile = load("res://Projectiles/EnemyShot.tscn")
signal shoot


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#print(self.position)
	##target = Vector2.ZERO
	##nav.set_target_location(player.global_position)
#	nav.set_target_location(self.position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#var direction := global_position.direction_to(nav.get_next_location())


func _physics_process(delta):
	#pass
	#var next_location = $NavigationAgent2D.get_next_location()
	#direction = (next_location - global_position).normalized()
	
	#update enemy sight target to player position. Note: You must
	# import player object for this to work, so it won't run by itself
	# without main. Also, you must have both objects be of the same type
	# KinematicBody2D for some reason
##	var space = get_world_2d().direct_space_state
##	var enemy_vision = space.intersect_ray(global_transform.origin,
##							player.global_transform.origin, see_thru)
	
##	if enemy_vision:
##		if enemy_vision.collider==player && can_spot:
##		if enemy_vision.collider == player:
##			target = player.global_transform.origin
##			direction = (target - global_position).normalized()
			#$GunTimer.start()
			##nav.set_target_location(target)

	var for_calc = player.global_transform.origin - self.global_transform.origin
	var dist = sqrt(for_calc.x * for_calc.x + for_calc.y * for_calc.y)
			#print(dist, can_fire)
	if ((dist < 1000) && (can_fire)):
				#print(can_fire)
		$GunTimer.start()
		can_fire = false

		var fire_direction = (gunpoint.global_transform.origin - end_of_gun.global_transform.origin).normalized()
		var arrow = Projectile.instance()
		#see_thru.append(arrow)
		emit_signal("shoot", arrow, global_position, fire_direction)
##		else:
##			target = self.position
##			direction = Vector2.ZERO
	##if !target_reached:
		#print("({",next_location)
		##direction = (next_location - global_position).normalized()
		##target_reached = abs(next_location.x - position.x) < 0.1 && abs(next_location.y - position.y) < 0.1
		#print(target_reached, position)
##	else:
##		direction = (next_location - global_position).normalized()
##		next_location = nav.get_next_location()
		#print(next_location)
##		if abs(next_location.x - init_location.x) > 1 && abs(next_location.y - init_location.y) > 1:
			#print("seen")
##			target_reached = false
	
	##look_at(target)
	#position += direction * speed * delta


func _on_GunTimer_timeout():
	#print("restart")
	can_fire = true
	$GunTimer.stop()



#func _on_NavigationTimer_timeout():
	#can_spot = true
#	$NavigationTimer.stop()
