extends KinematicBody2D


class_name Player

signal player_fired_bullet
signal player_fired_laser

export (PackedScene) var Fireball
export (int) var speed = 300

onready var end_of_gun = $EndofGun
onready var gunpoint = $GunDirection

onready var magic_shot = $Magic_Shoot
onready var animPlayer = $AnimationPlayer

var ammoBlue = 0
onready var inv_pos = 0

var ammo_blue = 0
var ammo_green = 0
var ammo_red = 11
var health: int = 100


func _physics_process(delta):
	var movement_direction := Vector2.ZERO
	if Input.is_action_pressed("move_up"):
		movement_direction.y -= 1
		animPlayer.play("Run")
	if Input.is_action_pressed("move_down"):
		movement_direction.y += 1
		animPlayer.play("Run")
	if Input.is_action_pressed("move_left"):
		movement_direction.x -= 1
		animPlayer.play("Run")
	if Input.is_action_pressed("move_right"):
		movement_direction.x += 1
		animPlayer.play("Run")
	#if Input.is_action_just_released("Run"):
	#	speed = 500
	#	animPlayer.play("Run")
	if Input.is_key_pressed(KEY_SHIFT):
		speed = 500
	else:
		speed = 300
	
	if movement_direction.x == 0 and movement_direction.y == 0:
		animPlayer.play("Idle")
	
	movement_direction = movement_direction.normalized()
	move_and_slide(movement_direction * speed)
	
	look_at(get_global_mouse_position())

func _unhandled_input(event: InputEvent):
	if event.is_action_released("swap_left"):
		inv_pos -= 1
<<<<<<< Updated upstream
		if inv_pos < 0:
			inv_pos = 6
		emit_signal("player_switched_weapon", inv_pos)
=======
		if inv_pos <= 0:
			inv_pos = 3
>>>>>>> Stashed changes
		print(inv_pos)
	if event.is_action_released("swap_right"):
		inv_pos += 1
		if inv_pos > 6:
			inv_pos = 0
		print(inv_pos)
	if event.is_action_released("Shoot"):
		if inv_pos == 0 && ammo_red > 0:
			ammo_red -= 1
			Shoot()
<<<<<<< Updated upstream
		elif inv_pos == 1 && ammo_red > 3:
			ammo_red -= 4
=======
		elif inv_pos == 1 && ammoBlue > 0:
			ammoBlue -= 1
>>>>>>> Stashed changes
			Shotgun()
		elif inv_pos == 2 && ammo_green > 0:
			ammo_green -= 1
			Explosive()
		elif inv_pos == 3 && ammo_blue > 0:
			ammo_blue -= 1
			Laser()


func Shoot():
	var fireball_instance = Fireball.instance()
	var direction = (gunpoint.global_transform.origin - end_of_gun.global_transform.origin).normalized()
	emit_signal("player_fired_bullet", fireball_instance,end_of_gun.global_position, direction)


func handle_hit():
	health -= 20
	#print("player hit", health)
	
	# when player is hit, HUD updates with -1 heart
	Global.lose_heart()

func Big_Shoot():
	var Bigshot = load("res://Projectiles/Big_Shot.tscn")
	var fireball_instance = Bigshot.instance()
	var direction = (gunpoint.global_transform.origin - end_of_gun.global_transform.origin).normalized()
	emit_signal("player_fired_bullet", fireball_instance,end_of_gun.global_position, direction)
	

func Shotgun():
	var Fireball = load("res://Projectiles/FireBall.tscn")
	var fireball_instance1 = Fireball.instance()
	var fireball_instance2 = Fireball.instance()
	var fireball_instance3 = Fireball.instance()
	var fireball_instance4 = Fireball.instance()
	
	fireball_instance1.shotty = true
	fireball_instance2.shotty = true
	fireball_instance3.shotty = true
	fireball_instance4.shotty = true
	
	var direction = (gunpoint.global_transform.origin - end_of_gun.global_transform.origin).normalized()
	var direction2 = direction.rotated($Shotgun_1.rotation)
	var direction3 = direction.rotated($Shotgun_2.rotation)
	var direction4 = direction.rotated($Shotgun_3.rotation)
	
	emit_signal("player_fired_bullet", fireball_instance1,end_of_gun.global_position, direction.rotated(PI/8))
	emit_signal("player_fired_bullet", fireball_instance2,$Shotgun_1.global_position, direction2)
	emit_signal("player_fired_bullet", fireball_instance3,$Shotgun_2.global_position, direction3)
	emit_signal("player_fired_bullet", fireball_instance4,$Shotgun_3.global_position, direction4)
	

func Explosive():
	var Fireball = load("res://Projectiles/Explosive.tscn")
	var fireball_instance = Fireball.instance()
	var direction = (gunpoint.global_transform.origin - end_of_gun.global_transform.origin).normalized()
	emit_signal("player_fired_bullet", fireball_instance,end_of_gun.global_position, direction)


func Laser():
	var laser = load("res://Projectiles/Laser.tscn")
	var laser_instance = laser.instance()
	laser_instance.add_exception(self)
	var direction = (gunpoint.global_transform.origin - end_of_gun.global_transform.origin).normalized()
	#laser_instance.global_position = gunpoint.global_position
	
	emit_signal("player_fired_laser", laser_instance, gunpoint.global_position, direction)
