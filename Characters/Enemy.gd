extends KinematicBody2D
#onready var animPlayer = $AnimationPlayer

class_name Enemy
var health: int = 30
var speed = 50
var direction = Vector2.ZERO
var target
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
			direction = (target - position).normalized()
			look_at(target)
		else:
			target = self.position
			direction = Vector2.ZERO
	else:
		target = self.position
		direction = Vector2.ZERO

	position += direction * speed * delta


func handle_hit():
	health -= 20
	if health <= 0:
		queue_free()
