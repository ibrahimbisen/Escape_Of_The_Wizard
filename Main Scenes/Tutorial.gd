extends Node2D

#Each time you make a new enemy instance, instantiate them by defining it as
#a variable and then connecting it to the current player instance and
#connect its signals to the main scene
onready var player: Player = $Player

onready var B1 = $BlueAmmo
onready var B2 = $B1
onready var B3 = $B2
onready var B4 = $B3
onready var B5 = $B4
onready var B6 = $B5
 
onready var R1 = $RedAmmo
onready var R2 = $R1
onready var R3 = $R2
onready var R4 = $R3
onready var R5 = $R4

onready var G1 = $GreenAmmo
onready var G2 = $G1
onready var G3 = $G2
onready var G4 = $G3

onready var enemy = $Enemy
onready var archer = $Archer_Enemy
onready var enemy1 = $Archer_Enemy2
onready var enemy2 = $Archer_Enemy3
onready var enemy3 = $Archer_Enemy4
onready var enemy4 = $Archer_Enemy5
onready var enemy5 = $Archer_Enemy6
onready var enemy6 = $a_e_7
onready var enemy7 = $a_e_8


onready var rocket2 = $RocketTurret2
onready var rocket3 = $RocketTurret3

onready var turret2 = $Turret2
onready var turret3 = $Turret3
#var EnemyArray = Array()


func _ready():
	get_tree().call_group("archers", "init_player")

	enemy1.player = player

	enemy3.player = player

	enemy5.player = player
	enemy6.player = player
	

	rocket2.player = player
	
	turret3.player = player

	
	player.connect("player_fired_bullet", self, "handle_bullet_spawned")
	player.connect("player_fired_laser", self, "handle_laser_spawned")
	player.connect("player_switched_weapon", self, "handle_switched_weapon")
	
	B2.connect("picked_up", self, "ammo_pick_up")
	B3.connect("picked_up", self, "ammo_pick_up")
	B4.connect("picked_up", self, "ammo_pick_up")
	B5.connect("picked_up", self, "ammo_pick_up")
	B6.connect("picked_up", self, "ammo_pick_up")
	
	R2.connect("picked_up", self, "ammo_pick_up")
	R3.connect("picked_up", self, "ammo_pick_up")
	R4.connect("picked_up", self, "ammo_pick_up")
	R5.connect("picked_up", self, "ammo_pick_up")

	G2.connect("picked_up", self, "ammo_pick_up")
	G3.connect("picked_up", self, "ammo_pick_up")
	G4.connect("picked_up", self, "ammo_pick_up")
	
	
	rocket2.connect("rocket", self, "handle_enemy_rocket_spawned")
	turret3.connect("shoot", self, "handle_enemy_bullet_spawned")
	
	enemy1.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy3.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy5.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy6.connect("shoot", self, "handle_enemy_bullet_spawned")


func handle_enemy_rocket_spawned(bullet: Explosive, a_position: Vector2, direction: Vector2):
	add_child(bullet)
	bullet.global_position = a_position
	bullet.set_direction(direction)


func handle_bullet_spawned(bullet: FireBall, a_position: Vector2, direction: Vector2):
	add_child(bullet)
	bullet.global_position = a_position
	bullet.set_direction(direction)


func handle_enemy_bullet_spawned(bullet: EnemyShot, a_position: Vector2, direction: Vector2):
	add_child(bullet)
	bullet.global_position = a_position
	bullet.set_direction(direction)

func ammo_pick_up(type: int):
	if type == 0:
		player.red_ammo += 2
	elif type == 1:
		player.blue_ammo += 5
	elif type == 2:
		player.green_ammo += 10

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



