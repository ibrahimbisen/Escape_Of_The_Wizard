extends KinematicBody2D
onready var animPlayer = $AnimationPlayer

class_name Enemy
var health: int = 100
var speed = 100
var direction = Vector2.ZERO
var velocity = Vector2.ZERO
var target
var can_see
onready var agent: NavigationAgent2D = $NavigationAgent2D
var player

var see_thru = [self]


func _ready():
	pass
	#print(player)
	#print(self.position)
	##target = Vector2.ZERO
	##agent.set_target_location(player.global_position)
#	nav.set_target_location(self.position)


func _physics_process(delta):
	if agent.is_navigation_finished():
		return
	if can_see:
		direction = global_position.direction_to(agent.get_next_location())
		#print(player)
		var desired_velocity = direction * speed
		var steering = (desired_velocity - velocity) * delta * 4
		velocity += steering
		velocity = move_and_slide(velocity)
		self.rotation = velocity.angle()
	#the enemy movement needs to be fixed
	#animPlayer.play("RESET")
	
	# update enemy sight target to player position. Note: You must
	# import player object for this to work, so it won't run by itself
	# without main. Also, you must have both objects be of the same type
	# KinematicBody2D for some reason
	##var space = get_world_2d().direct_space_state
	##var enemy_vision = space.intersect_ray(self.global_transform.origin,
	##								player.global_transform.origin, see_thru)
	#print(enemy_vision)
	
	##if enemy_vision:
		#print(enemy_vision.collider)
		##if enemy_vision.collider==player:
	if player.global_position.distance_to(global_position) < 700:
	##		target = enemy_vision.collider.global_transform.origin
	##		direction = (target - position).normalized()
			#look_at(enemy_vision.collider.global_transform.origin)
		can_see = true
	else:
		can_see = false
	##		target = self.position
	##		direction = Vector2.ZERO
	##else:
		##target = self.position
		##direction = Vector2.ZERO

##	position += velocity * delta


func handle_hit():
	health -= 20
	if health <= 0:
		queue_free()


func _on_NavigationTimer_timeout():
	agent.set_target_location(player.global_position)
