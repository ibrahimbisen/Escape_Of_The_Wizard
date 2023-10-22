extends Node2D

onready var player: Player = $Player
onready var enemy = $Enemy
onready var archer = $Archer_Enemy
onready var enemy1 = $Archer_Enemy2
onready var enemy2 = $Archer_Enemy3
onready var enemy3 = $Archer_Enemy4
onready var enemy4 = $Archer_Enemy5
onready var enemy5 = $Archer_Enemy6
onready var enemy6 = $a_e_7
onready var enemy7 = $a_e_8
onready var enemy8 = $a_e_9
onready var enemy9 = $a_e_10
onready var enemy10 = $a_e_11
onready var enemy11 = $a_e_12
onready var enemy12 = $a_e_13
onready var enemy13 = $a_e_14
var EnemyArray = Array()


func _ready():
	get_tree().call_group("archers", "init_player")
	enemy.player = player
	archer.player = player
	enemy1.player = player
	enemy2.player = player
	enemy3.player = player
	enemy4.player = player
	enemy5.player = player
	enemy6.player = player
	enemy7.player = player
	enemy8.player = player
	enemy9.player = player
	enemy10.player = player
	enemy11.player = player
	enemy12.player = player
	enemy13.player = player
	
	player.connect("player_fired_bullet", self, "handle_bullet_spawned")
	player.connect("player_fired_laser", self, "handle_laser_spawned")
	player.connect("player_switched_weapon", self, "handle_switched_weapon")
	
	archer.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy1.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy2.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy3.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy4.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy5.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy6.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy7.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy8.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy9.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy10.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy11.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy12.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy13.connect("shoot", self, "handle_enemy_bullet_spawned")


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

