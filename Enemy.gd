extends KinematicBody2D
var speed = 30
var direction = Vector2.ZERO
#var sight
var target = Vector2.ZERO
#onready var player : PhysicsBody = $"res://Player.tscn"
#onready var player = preload("res://Player.tscn").instance()
onready var player
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
	else:
		#print("****")
		target = self.position
		direction = Vector2.ZERO

	position += direction * speed * delta
