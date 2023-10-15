extends Node2D

onready var player: Player = $Player
onready var enemy = $Enemy
onready var archer = $Archer_Enemy




func _ready():
	

	
	
	enemy.player = player
	archer.player = player
	player.connect("player_fired_bullet", self, "handle_bullet_spawned")
	archer.connect("shoot", self, "handle_enemy_bullet_spawned")
	player.connect("player_fired_laser", self, "handle_laser_spawned")


func handle_bullet_spawned(bullet: FireBall, a_position: Vector2, direction: Vector2):
	add_child(bullet)
	bullet.global_position = a_position
	bullet.set_direction(direction)


func handle_enemy_bullet_spawned(bullet: EnemyShot, a_position: Vector2, direction: Vector2):
	add_child(bullet)
	bullet.global_position = a_position
	bullet.set_direction(direction)


#func handle_laser_spawned(bullet: Laser, a_position: Vector2, direction: Vector2):
#	add_child(bullet)
#	bullet.set_is_casting(true)
#	bullet.get_node("Line2D").add_point(a_position)
#	var fire_to = a_position + (direction * 100)
#	bullet.get_node("Line2D").add_point(fire_to)
#	bullet.cast_to = fire_to



