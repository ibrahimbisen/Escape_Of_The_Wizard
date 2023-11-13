extends Node2D

#Each time you make a new enemy instance, instantiate them by defining it as
#a variable and then connecting it to the current player instance and
#connect its signals to the main scene
onready var player: Player = $Player

onready var key1 = $Key
onready var door1 = $Door

onready var B1 = $BlueAmmo
onready var B2 = $B1
onready var B3 = $B2
onready var B4 = $B3
onready var B5 = $B4
onready var B6 = $B5
onready var B7 = $B6
onready var B8 = $B7
onready var B9 = $B8
onready var B10 = $B9
onready var B11 = $B10
onready var B12 = $B11
onready var B13 = $B12
onready var B14 = $B13
onready var B15 = $B14
onready var B16 = $B15
onready var B17 = $B16
onready var B18 = $B17
onready var B19 = $B18
onready var B20 = $B19
onready var B21 = $B20
onready var B22 = $B21
onready var B23 = $B22
onready var B24 = $B23
onready var B25 = $B23
onready var B26 = $B24
onready var B27 = $B25
onready var B28 = $B26




onready var R1 = $RedAmmo
onready var R2 = $R1
onready var R3 = $R2
onready var R4 = $R3
onready var R5 = $R4
onready var R6 = $R5
onready var R7 = $R6
onready var R8 = $R7
onready var R9 = $R8
onready var R10 = $R9
onready var R11 = $R10
onready var R12 = $R11
onready var R13 = $R12
onready var R14 = $R13

onready var G1 = $GreenAmmo
onready var G2 = $G1
onready var G3 = $G2
onready var G4 = $G3
onready var G5 = $G4
onready var G6 = $G5
onready var G7 = $G6
onready var G8 = $G7
onready var G9 = $G8
onready var G10 = $G9
onready var G11 = $G10
onready var G12 = $G11
onready var G13 = $G12
onready var G14 = $G13
onready var G15 = $G14
onready var G16 = $G15
onready var G17 = $G16



onready var spawn1 = $TestSpawner

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
onready var enemy50 = $a_e_51
onready var enemy51 = $a_e_52
onready var enemy52 = $a_e_53
onready var enemy53 = $a_e_54
onready var enemy54 = $a_e_55
onready var enemy55 = $a_e_56
onready var enemy56 = $a_e_57
onready var enemy57 = $a_e_58
onready var enemy58 = $a_e_59
onready var enemy59 = $a_e_60

onready var rocket1 = $RocketTurret
onready var rocket2 = $RocketTurret2
onready var rocket3 = $RocketTurret3
onready var rocket4 = $RocketTurret4
onready var rocket5 = $RocketTurret5
onready var rocket6 = $RocketTurret6
onready var rocket7 = $RocketTurret7
onready var rocket8 = $RocketTurret8
onready var rocket9 = $RocketTurret9
onready var rocket10 = $RocketTurret10
onready var rocket11 = $RocketTurret11
onready var rocket12 = $RocketTurret12
onready var rocket13 = $RocketTurret13
onready var rocket14 = $RocketTurret14
onready var rocket15 = $RocketTurret15
onready var rocket16 = $RocketTurret16
onready var rocket17 = $RocketTurret17
onready var rocket18 = $RocketTurret18
onready var rocket19 = $RocketTurret19
onready var rocket20 = $RocketTurret20


onready var turret1 = $Turret
onready var turret2 = $Turret2
onready var turret3 = $Turret3
onready var turret4 = $Turret4
onready var turret5 = $Turret5
onready var turret6 = $Turret6
onready var turret7 = $Turret7
onready var turret8 = $Turret8
onready var turret9 = $Turret9
onready var turret10 = $Turret10
#var EnemyArray = Array()


func _ready():
	Global.current_scene = 0
	
	PlayerInventory.reset_item("Laser Blast", 0)
	PlayerInventory.reset_item("Crossbow", 0)
	PlayerInventory.reset_item("Fire Ball", 0)
	key1.connect("key_picked_up", self, "door_open")
	key1.door = door1
	#get_tree().call_group("archers", "init_player")
	spawn1.player = player
	
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
	enemy50.player = player
	enemy51.player = player
	enemy52.player = player
	enemy53.player = player
	enemy54.player = player
	enemy55.player = player
	enemy56.player = player
	enemy57.player = player
	enemy58.player = player
	enemy59.player = player
	
	rocket1.player = player
	rocket2.player = player
	rocket3.player = player
	rocket4.player = player
	rocket5.player = player
	rocket6.player = player
	rocket7.player = player
	rocket8.player = player
	rocket9.player = player
	rocket10.player = player
	rocket11.player = player
	rocket12.player = player
	rocket13.player = player
	rocket14.player = player
	rocket15.player = player
	rocket16.player = player
	rocket17.player = player
	rocket18.player = player
	rocket19.player = player
	rocket20.player = player
	
	
	turret1.player = player
	turret2.player = player
	turret3.player = player
	turret4.player = player
	turret5.player = player
	turret6.player = player
	turret7.player = player
	turret8.player = player
	turret9.player = player
	turret10.player = player
	
	player.connect("player_fired_bullet", self, "handle_bullet_spawned")
	player.connect("player_fired_laser", self, "handle_laser_spawned")
	player.connect("player_switched_weapon", self, "handle_switched_weapon")
	
	B1.connect("picked_up", self, "ammo_pick_up")
	B2.connect("picked_up", self, "ammo_pick_up")
	B3.connect("picked_up", self, "ammo_pick_up")
	B4.connect("picked_up", self, "ammo_pick_up")
	B5.connect("picked_up", self, "ammo_pick_up")
	B6.connect("picked_up", self, "ammo_pick_up")
	B7.connect("picked_up", self, "ammo_pick_up")
	B8.connect("picked_up", self, "ammo_pick_up")
	B9.connect("picked_up", self, "ammo_pick_up")
	B10.connect("picked_up", self, "ammo_pick_up")
	B11.connect("picked_up", self, "ammo_pick_up")
	B12.connect("picked_up", self, "ammo_pick_up")
	B13.connect("picked_up", self, "ammo_pick_up")
	B14.connect("picked_up", self, "ammo_pick_up")
	B15.connect("picked_up", self, "ammo_pick_up")
	B16.connect("picked_up", self, "ammo_pick_up")
	B17.connect("picked_up", self, "ammo_pick_up")
	B18.connect("picked_up", self, "ammo_pick_up")
	B19.connect("picked_up", self, "ammo_pick_up")
	B20.connect("picked_up", self, "ammo_pick_up")
	B21.connect("picked_up", self, "ammo_pick_up")
	B22.connect("picked_up", self, "ammo_pick_up")
	B23.connect("picked_up", self, "ammo_pick_up")
	B24.connect("picked_up", self, "ammo_pick_up")
	B25.connect("picked_up", self, "ammo_pick_up")
	B26.connect("picked_up", self, "ammo_pick_up")
	B27.connect("picked_up", self, "ammo_pick_up")
	B28.connect("picked_up", self, "ammo_pick_up")
	
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
	R11.connect("picked_up", self, "ammo_pick_up")
	R12.connect("picked_up", self, "ammo_pick_up")
	R13.connect("picked_up", self, "ammo_pick_up")
	R14.connect("picked_up", self, "ammo_pick_up")
	
	G1.connect("picked_up", self, "ammo_pick_up")
	G2.connect("picked_up", self, "ammo_pick_up")
	G3.connect("picked_up", self, "ammo_pick_up")
	G4.connect("picked_up", self, "ammo_pick_up")
	G5.connect("picked_up", self, "ammo_pick_up")
	G6.connect("picked_up", self, "ammo_pick_up")
	G7.connect("picked_up", self, "ammo_pick_up")
	G8.connect("picked_up", self, "ammo_pick_up")
	G9.connect("picked_up", self, "ammo_pick_up")
	G10.connect("picked_up", self, "ammo_pick_up")
	G11.connect("picked_up", self, "ammo_pick_up")
	G12.connect("picked_up", self, "ammo_pick_up")
	G13.connect("picked_up", self, "ammo_pick_up")
	G14.connect("picked_up", self, "ammo_pick_up")
	G15.connect("picked_up", self, "ammo_pick_up")
	G16.connect("picked_up", self, "ammo_pick_up")
	G17.connect("picked_up", self, "ammo_pick_up")
	
	
	rocket1.connect("rocket", self, "handle_enemy_rocket_spawned")
	rocket2.connect("rocket", self, "handle_enemy_rocket_spawned")
	rocket3.connect("rocket", self, "handle_enemy_rocket_spawned")
	rocket4.connect("rocket", self, "handle_enemy_rocket_spawned")
	rocket5.connect("rocket", self, "handle_enemy_rocket_spawned")
	rocket6.connect("rocket", self, "handle_enemy_rocket_spawned")
	rocket7.connect("rocket", self, "handle_enemy_rocket_spawned")
	rocket8.connect("rocket", self, "handle_enemy_rocket_spawned")
	rocket9.connect("rocket", self, "handle_enemy_rocket_spawned")
	rocket10.connect("rocket", self, "handle_enemy_rocket_spawned")
	rocket12.connect("rocket", self, "handle_enemy_rocket_spawned")
	rocket13.connect("rocket", self, "handle_enemy_rocket_spawned")
	rocket14.connect("rocket", self, "handle_enemy_rocket_spawned")
	rocket15.connect("rocket", self, "handle_enemy_rocket_spawned")
	rocket16.connect("rocket", self, "handle_enemy_rocket_spawned")
	rocket17.connect("rocket", self, "handle_enemy_rocket_spawned")
	rocket18.connect("rocket", self, "handle_enemy_rocket_spawned")
	rocket19.connect("rocket", self, "handle_enemy_rocket_spawned")
	rocket20.connect("rocket", self, "handle_enemy_rocket_spawned")
	
	turret1.connect("shoot", self, "handle_enemy_bullet_spawned")
	turret2.connect("shoot", self, "handle_enemy_bullet_spawned")
	turret3.connect("shoot", self, "handle_enemy_bullet_spawned")
	turret4.connect("shoot", self, "handle_enemy_bullet_spawned")
	turret5.connect("shoot", self, "handle_enemy_bullet_spawned")
	turret6.connect("shoot", self, "handle_enemy_bullet_spawned")
	turret7.connect("shoot", self, "handle_enemy_bullet_spawned")
	turret8.connect("shoot", self, "handle_enemy_bullet_spawned")
	turret9.connect("shoot", self, "handle_enemy_bullet_spawned")
	turret10.connect("shoot", self, "handle_enemy_bullet_spawned")
	
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
	enemy50.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy51.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy52.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy53.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy54.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy55.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy56.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy57.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy58.connect("shoot", self, "handle_enemy_bullet_spawned")
	enemy59.connect("shoot", self, "handle_enemy_bullet_spawned")


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
		player.red_ammo += 10
	elif type == 1:
		player.blue_ammo += 5
	elif type == 2:
		player.green_ammo += 2	

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

func door_open(door: door):
	door.queue_free()

