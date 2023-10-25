extends Node2D

#Each time you make a new enemy instance, instantiate them by defining it as
#a variable and then connecting it to the current player instance and
#connect its signals to the main scene
onready var player: Player = $Player
onready var blue = $BlueAmmo

onready var enemy = $Enemy
onready var archer = $Archer_Enemy
onready var enemy1 = $Archer_Enemy2
onready var enemy2 = $Archer_Enemy3

var EnemyArray = Array()


func _ready():
	get_tree().call_group("archers", "init_player")
	enemy.player = player
	archer.player = player
	enemy1.player = player
	enemy2.player = player


	
	player.connect("player_fired_bullet", self, "handle_bullet_spawned")
	player.connect("player_fired_laser", self, "handle_laser_spawned")
	
	
	archer.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy1.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy2.connect("shoot", self, "handle_enemy_bullet_spawned")




func handle_bullet_spawned(bullet: FireBall, a_position: Vector2, direction: Vector2):
	add_child(bullet)
	bullet.global_position = a_position
	bullet.set_direction(direction)


func handle_enemy_bullet_spawned(bullet: EnemyShot, a_position: Vector2, direction: Vector2):
	add_child(bullet)
	bullet.global_position = a_position
	bullet.set_direction(direction)


func handle_switched_weapon(weapon: int):
	pass

func handle_pick_up(ammo: int):
	if ammo == 3:
		player.ammoBlue += 5


func handle_laser_spawned(bullet: Laser, a_position: Vector2, direction: Vector2):
	add_child(bullet)
	bullet.set_is_casting(true)
	var fire_to = a_position + (direction * 100)
	#Sets the laser origin to the player's wand point
	bullet.global_position = a_position
	#Because the origin is now set to the player, we need to subtract the wand
	#coordinates from the coordinates of where the player clicked to get the 
	#relative end point of the raycast
	bullet.cast_to = fire_to-a_position
	#The origin is now the wand point, so the laser is drawn starting from origin
	bullet.get_node("Line2D").add_point(Vector2(0,0))
	bullet.get_node("Line2D").add_point(fire_to-a_position)



