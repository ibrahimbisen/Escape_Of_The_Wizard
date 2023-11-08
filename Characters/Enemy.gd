extends KinematicBody2D

class_name Enemy
var health: int = 30
var speed = 50
var direction = Vector2.ZERO
var target
onready var player

var see_thru = [self]


func _physics_process(delta):
	var space = get_world_2d().direct_space_state
	var enemy_vision = space.intersect_ray(self.global_transform.origin,
									player.global_transform.origin, see_thru)
	#print(enemy_vision)
	
	if enemy_vision:
		#print(enemy_vision.collider)
		if enemy_vision.collider==player:
			target = enemy_vision.collider.global_transform.origin
			direction = (target - global_transform.origin).normalized()
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
	$EnemyHurt.play()
	if health <= 0:
		queue_free()
