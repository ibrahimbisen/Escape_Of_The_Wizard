extends Node2D
var Projectile = load("res://projectile.tscn")
var Projectiles = Array()
var player
var enemy
signal spawned
#onready var camera = get_node("Camera2D")
#var sight
#onready var space = get_viewport().world.direct_space_state
#onready var vision = get_node("Enemy/Sight")
#var can_see_player


# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("Player")
	enemy = get_node("Enemy")
	var archer = get_node("ArcherEnemy")
	enemy.player = player
	archer.player = player
	archer.connect("spawned", self, "_on_Main_spawned")
	player.connect("spawned", self, "_on_Main_spawned")


func _physics_process(delta):
	pass
	#print("*",player.global_position)
	#print(enemy.position)
	
	#enemy.target = player.global_position
	
	#var space_state = get_world_2d().direct_space_state
	
	#print(space_state)
	# godot 4 var query = PhysicsRayQueryParameters2D.create(global_position, target)
	
	#enemy.sight = space_state.intersect_ray(enemy.global_position, enemy.target, [enemy])
	
	#var layer = enemy.collision_layer
	#print(enemy.global_position)
	#print(enemy.target)
	
	#var enemy_vision = space_state.intersect_ray(enemy.global_position, enemy.target, [], 2)
	#enemy.sight = (enemy_vision.collider == player)
	#print(enemy_vision)
	#print(enemy_vision.collider)
	
	
	for p in Projectiles:
		if (p.ticks > 45):
			p.queue_free()
			Projectiles.erase(p)
			remove_child(p)
			continue
#		
		var collided = p.move_and_collide(p.speed * delta * p.direction)
		if collided:
			var collider = collided.get_collider()
			p.emit_signal("projectile_hit")
			Projectiles.erase(p)
			remove_child(p)
			#print("*")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#camera.position = player.position
	
#	if Input.is_action_just_pressed("Shoot"):
		#enemy.target = player.global_position
		#print(enemy.target, "=", player.global_position, enemy.global_position)
		
#		var projectile = Projectile.instance()
#		var mouse_pos = get_viewport().get_mouse_position()
		
#		projectile.position = player.position
#		var dir1 = Vector2(mouse_pos.x, mouse_pos.y)
#		var dir2 = Vector2(player.position)
#		projectile.direction = Vector2(dir1.x-dir2.x, dir1.y-dir2.y).normalized()
#		Projectiles.append(projectile)
#		add_child(projectile)


func _on_Main_spawned(x):
	print(x)
	add_child(x)
	Projectiles.append(x)
