extends Node2D

#Each time you make a new enemy instance, instantiate them by defining it as
#a variable and then connecting it to the current player instance and
#connect its signals to the main scene
onready var player: Player = $Player

onready var B0 = $BlueAmmo
onready var B1 = $B1
onready var B2 = $B2
onready var B3 = $B3
onready var R0 = $RedAmmo
onready var R1 = $R1
onready var R2 = $R2
onready var R3 = $R3
onready var R4 = $R4
onready var R5 = $R5
onready var R6 = $R6
onready var R7 = $R7
onready var R8 = $R8
onready var R9 = $R9
onready var R10 = $R10
onready var G1 = $GreenAmmo

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
onready var enemy14 = $a_e_15
onready var enemy15 = $a_e_16
onready var enemy16 = $a_e_17
onready var enemy17 = $a_e_18
onready var enemy18 = $a_e_19
onready var enemy19 = $a_e_20
onready var enemy20 = $a_e_21
onready var enemy21 = $a_e_22
onready var enemy22 = $a_e_23
onready var enemy23 = $a_e_24
onready var enemy24 = $a_e_25
onready var enemy25 = $a_e_26
onready var enemy26 = $a_e_27
onready var enemy27 = $a_e_28
onready var enemy28 = $a_e_29
onready var enemy29 = $a_e_30
onready var enemy30 = $a_e_31
onready var enemy31 = $a_e_32
onready var enemy32 = $a_e_33
onready var enemy33 = $a_e_34
onready var enemy34 = $a_e_35
onready var enemy35 = $a_e_36
onready var enemy36 = $a_e_37
onready var enemy37 = $a_e_38
onready var enemy38 = $a_e_39
onready var enemy39 = $a_e_40
onready var enemy40 = $a_e_41
onready var enemy41 = $a_e_42
onready var enemy42 = $a_e_43
onready var enemy43 = $a_e_44
onready var enemy44 = $a_e_45
onready var enemy45 = $a_e_46
onready var enemy46 = $a_e_47
onready var enemy47 = $a_e_48
onready var enemy48 = $a_e_49
onready var enemy49 = $a_e_50

#var EnemyArray = Array()


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
	enemy14.player = player
	enemy15.player = player
	enemy16.player = player
	enemy17.player = player
	enemy18.player = player
	enemy19.player = player
	enemy20.player = player
	enemy21.player = player
	enemy22.player = player
	enemy23.player = player
	enemy24.player = player
	enemy25.player = player
	enemy26.player = player
	enemy27.player = player
	enemy28.player = player
	enemy29.player = player
	enemy30.player = player
	enemy31.player = player
	enemy32.player = player
	enemy33.player = player
	enemy34.player = player
	enemy35.player = player
	enemy36.player = player
	enemy37.player = player
	enemy38.player = player
	enemy39.player = player
	enemy40.player = player
	enemy41.player = player
	enemy42.player = player
	enemy43.player = player
	enemy44.player = player
	enemy45.player = player
	enemy46.player = player
	enemy47.player = player
	enemy48.player = player
	enemy49.player = player
	
	player.connect("player_fired_bullet", self, "handle_bullet_spawned")
	player.connect("player_fired_laser", self, "handle_laser_spawned")
	player.connect("player_switched_weapon", self, "handle_switched_weapon")
	
	B0.connect("picked_up", self, "ammo_pick_up")
	B1.connect("picked_up", self, "ammo_pick_up")
	B2.connect("picked_up", self, "ammo_pick_up")
	B3.connect("picked_up", self, "ammo_pick_up")
	R0.connect("picked_up", self, "ammo_pick_up")
	R1.connect("picked_up", self, "ammo_pick_up")
	R2.connect("picked_up", self, "ammo_pick_up")
	R3.connect("picked_up", self, "ammo_pick_up")
	R4.connect("picked_up", self, "ammo_pick_up")
	R5.connect("picked_up", self, "ammo_pick_up")
	R6.connect("picked_up", self, "ammo_pick_up")
	R7.connect("picked_up", self, "ammo_pick_up")
	R8.connect("picked_up", self, "ammo_pick_up")
	R9.connect("picked_up", self, "ammo_pick_up")
	R10.connect("picked_up", self, "ammo_pick_up")
	G1.connect("picked_up", self, "ammo_pick_up")
	
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
	enemy14.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy15.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy16.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy17.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy18.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy19.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy20.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy21.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy22.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy23.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy24.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy25.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy26.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy27.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy28.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy29.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy30.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy31.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy32.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy33.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy34.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy35.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy36.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy37.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy38.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy39.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy40.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy41.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy42.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy43.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy44.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy45.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy46.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy47.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy48.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy49.connect("shoot", self, "handle_enemy_bullet_spawned")


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
		player.red_ammo += 20
	elif type == 1:
		player.blue_ammo += 7
	elif type == 2:
		player.green_ammo += 6


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



