extends KinematicBody2D

class_name Player

signal player_fired_bullet

export (PackedScene) var Fireball
export (int) var speed = 600

onready var end_of_gun = $EndofGun
onready var gunpoint = $GunDirection
#onready var magic_shot = $Magic_Shoot

var health: int = 100

func _ready():
	pass


func _physics_process(delta):
	var movement_direction := Vector2.ZERO
	if Input.is_action_pressed("move_up"):
		movement_direction.y -= 1
	if Input.is_action_pressed("move_down"):
		movement_direction.y += 1
	if Input.is_action_pressed("move_left"):
		movement_direction.x -= 1
	if Input.is_action_pressed("move_right"):
		movement_direction.x += 1
	
	movement_direction = movement_direction.normalized()
	move_and_slide(movement_direction * speed)
	
	look_at(get_global_mouse_position())

func _unhandled_input(event: InputEvent):
	if event.is_action_released("Shoot"):
		#THis needs to be fixed it is audio of the gunshot but it crashes as soon as you shoot
		#magic_shot.play()
		#Shoot()
		#Shotgun()
		Explosive()


func Shoot():
	var fireball_instance = Fireball.instance()
	var direction = (gunpoint.global_transform.origin - end_of_gun.global_transform.origin).normalized()
	emit_signal("player_fired_bullet", fireball_instance,end_of_gun.global_position, direction)


func handle_hit():
	health -= 20
	print("player hit", health)


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
