extends KinematicBody2D
var speed = 30
var direction = Vector2.ZERO
#var sight
var target = Vector2.ZERO
#onready var player : PhysicsBody = $"res://Player.tscn"
#onready var player = preload("res://Player.tscn").instance()
onready var player
var Projectile = load("res://projectile.tscn")
var Projectiles = Array()
#onready var line = $"Line2D"

# Called when the node enters the scene tree for the first time.
func _ready():
	#line.add_point(Vector2.ZERO)
	#line.add_point(Vector2.ZERO)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(position)
	#line.set_point_position(0,global_position)
	#print(player.global_position)
	#line.set_point_position(1,player.global_position)
	pass


func _physics_process(delta):
	for p in Projectiles:
		if (p.ticks > 45):
			p.queue_free()
			Projectiles.erase(p)
			remove_child(p)
			continue
		
		var collided = p.move_and_collide(p.speed * delta * p.direction)
		if collided:
			var collider = collided.get_collider()
			p.emit_signal("projectile_hit")
			Projectiles.erase(p)
			remove_child(p)
	
	#update enemy sight target to player position. Note: You must
	# import player object for this to work, so it won't run by itself
	# without main. Also, you must have both objects be of the same type
	# KinematicBody2D for some reason
	var space = get_world_2d().direct_space_state
	var enemy_vision = space.intersect_ray(self.global_transform.origin,
							player.global_transform.origin, [self])
	#print(enemy_vision)
	
	if enemy_vision:
		#print(enemy_vision.collider)
		if enemy_vision.collider==player:
			#print("*")
			target = enemy_vision.collider.global_transform.origin
			direction = (target - position).normalized()
			
		else:
			target = self.position
			direction = Vector2.ZERO
			var for_calc = player.global_transform.origin - self.global_transform.origin
			var dist = sqrt(for_calc.x * for_calc.x + for_calc.y * for_calc.y)
			if (dist) < 100:
				var arrow = Projectile.instance()
				arrow.speed = 250
				arrow.direction = self.direction
				arrow.texture = load("res://Assets/PNG/Items/arrow_head.png")
				add_child(arrow)
				Projectiles.append(arrow)
	else:
		#print("****")
		target = self.position
		direction = Vector2.ZERO

	position += direction * speed * delta
