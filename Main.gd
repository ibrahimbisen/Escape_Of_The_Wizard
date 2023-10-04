extends Node2D

onready var bullet_manager = $Bullet_Manager
onready var player = $Bullet_Manager




func _ready():
	player.connect("player_fired_bullet", bullet_manager, "handle_bullet_spawned")
