extends Node2D

onready var bullet_manager = $Bullet_Manager
# think of the below as object oriented inheritence
onready var player: Player = $Bullet_Manager




func _ready():
	player.connect("player_fired_bullet", bullet_manager, "handle_bullet_spawned")
