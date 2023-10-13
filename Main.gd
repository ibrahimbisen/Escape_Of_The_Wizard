extends Node2D
#onready var bullet_manager = $Bullet_Manager
# think of the below as object oriented inheritence
##onready var player: Player = $Player
export var path_to_player := NodePath()
onready var player = get_node(path_to_player)

onready var enemy = $Enemy
onready var archer = $Archer_Enemy
#onready var bullet = $FireBall


func _ready():
	enemy.player = player
	archer.player = player
	#enemy.agent.set_target_location(player.global_position)
	#archer.agent.set_target_location(player.global_position)
	#var gun = get_node("Player/Gun")
	player.connect("player_fired_bullet", self, "handle_bullet_spawned")
	archer.connect("shoot", self, "handle_enemy_bullet_spawned")
	#fireball.connect("gone", self, "handle_bullet_gone")
	#player.connect("player_fired_bullet", bullet_manager, "handle_bullet_spawned")


func _process(delta):
	#print($"Enemy Pathfinding/NavigationPolygonInstance".get_navigation_polygon().get_polygon_count())
	pass


func handle_bullet_spawned(bullet: FireBall, a_position: Vector2, direction: Vector2):
	#print(a_position)
	add_child(bullet)
	bullet.global_position = a_position
	bullet.set_direction(direction)


func handle_enemy_bullet_spawned(bullet: EnemyShot, a_position: Vector2, direction: Vector2):
	add_child(bullet)
	bullet.global_position = a_position
	bullet.set_direction(direction)

