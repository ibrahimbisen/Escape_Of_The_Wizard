extends KinematicBody2D


class_name Player

signal player_fired_bullet
signal player_fired_laser
signal player_switched_weapon

export (PackedScene) var Fireball
export (int) var speed = 300

onready var end_of_gun = $EndofGun
onready var gunpoint = $GunDirection

onready var magic_shot = $Magic_Shoot
onready var animPlayer = $AnimationPlayer

onready var blue_ammo = 0
onready var red_ammo = 0
onready var green_ammo = 0
onready var inv_pos = 0

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

func _input(event: InputEvent):
	if event.is_action_released("scroll_up"):
		inv_pos -= 1
		if inv_pos < 0:
			inv_pos = 2
		#emit_signal("player_switched_weapon", inv_pos)
		#print(inv_pos)
	if event.is_action_released("scroll_down"):
		inv_pos += 1
		if inv_pos > 2:
			inv_pos = 0
		#print(inv_pos)
		#emit_signal("player_switched_weapon", inv_pos)

	if event.is_action_pressed("Shoot"):

		if inv_pos == 0 && red_ammo > 0:
			$Magic_Shoot.play()
			red_ammo -= 1
			Shoot()
			PlayerInventory.subtract_item("Laser Blast", 1)
			
		elif inv_pos == 1 && blue_ammo > 0:
			$Magic_Shoot.play()
			blue_ammo -= 1
			Shotgun()
			PlayerInventory.subtract_item("Crossbow", 1)
			
		elif inv_pos == 2 && green_ammo > 0:
			$Magic_Shoot.play()
			green_ammo -= 1
			Explosive()
			PlayerInventory.subtract_item("Fire Ball", 1)
			
			
			
		#elif inv_pos == 3:
		#	Laser()


func Shoot():
	var fireball_instance = Fireball.instance()
	var direction = (gunpoint.global_transform.origin - end_of_gun.global_transform.origin).normalized()
	emit_signal("player_fired_bullet", fireball_instance,end_of_gun.global_position, direction)
	

func handle_hit():
	health -= 20
	$Hurt.play()
	
	# when player is hit, HUD updates with -1 heart
	Global.lose_heart()
	$White_Timer.start()
	$Damage_Sprite.show()
	$Sprite.hide()


func Big_Shoot():
	var Bigshot = load("res://Projectiles/Big_Shot.tscn")
	var fireball_instance = Bigshot.instance()
	var direction = (gunpoint.global_transform.origin - end_of_gun.global_transform.origin).normalized()
	emit_signal("player_fired_bullet", fireball_instance,end_of_gun.global_position, direction)
	

func Shotgun():
	var Fireball = load("res://Projectiles/Arrow.tscn")
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


func _on_White_Timer_timeout():
	$White_Timer.stop()
	$Sprite.show()
	$Damage_Sprite.hide()
