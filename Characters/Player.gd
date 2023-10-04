extends KinematicBody2D

class_name Player

signal player_fired_bullet(bullet, position, direction)


export (PackedScene) var Fireball
export (int) var speed = 100

onready var end_of_gun = $EndofGun
onready var gundirection = $GunDirection
onready var magic_shot = $Magic_Shoot

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
		Shoot()


func Shoot():
	var fireball_instance = Fireball.instance()
	var direction = gundirection.global_position - end_of_gun.global_position.normalized()
	emit_signal("player_fired_bullet", fireball_instance,end_of_gun.global_position, direction)
	print("Player shotted")
	


func handle_hit():
	health -= 20
	print("player hit", health)



