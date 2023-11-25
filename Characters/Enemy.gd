extends KinematicBody2D
onready var animPlayer = $AnimationPlayer

class_name Enemy
var health: int = 30
var speed = 40
var direction = Vector2.ZERO
var target
var turning_speed = 0.05
onready var player

var see_thru = [self]


func _physics_process(delta):
	#the enemy movement needs to be fixed
	#animPlayer.play("RESET")
	
	# update enemy sight target to player position. Note: You must
	# import player object for this to work, so it won't run by itself
	# without main. Also, you must have both objects be of the same type
	# KinematicBody2D for some reason
	var space = get_world_2d().direct_space_state
	var enemy_vision = space.intersect_ray(self.global_transform.origin,
									player.global_transform.origin, see_thru)
	#print(enemy_vision)
	
	if enemy_vision:
		#print(enemy_vision.collider)
		if enemy_vision.collider==player:
			target = enemy_vision.collider.global_transform.origin
			direction = (target - global_transform.origin).normalized()
			turner(turn_calc())
		else:
			target = self.position
			direction = Vector2.ZERO
	else:
		target = self.position
		direction = Vector2.ZERO

	position += direction * speed * delta


func handle_hit():
	health -= 20
	$EnemyHurt.play()
	if health <= 0:
		queue_free()

func turn_calc():
	#print((get_angle_to(player.global_position)))
	return (get_angle_to(player.global_position))
	
func turner(rot: float):
	#print(rot, " &&& ", rotation)
	#var to_rot = rot - rotation
	#print(to_rot)
	if rot > turning_speed:
		self.rotation += turning_speed
	elif rot < -turning_speed:
		self.rotation -= turning_speed
