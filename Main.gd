extends Node2D

signal player_fired_bullet


#onready var bullet_manager = $Bullet_Manager
# think of the below as object oriented inheritence
#onready var player: Player = $Player
onready var player = $Player


func _ready():
	player.connect("player_fired_bullet", self, "handle_bullet_spawned")
	#player.connect("player_fired_bullet", bullet_manager, "handle_bullet_spawned")


func _process(delta):
	#print("x")
	pass


func handle_bullet_spawned(bullet: FireBall, position: Vector2, direction: Vector2):
	print("x")
	add_child(bullet)
	bullet.global_position = position
	bullet.set_direction(direction)
