extends Node2D
onready var player
var can_spawn = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _physics_process(delta):
	var dist = player.global_position.distance_to(self.global_position)
	if dist < 800 && can_spawn:
		can_spawn = false
		$SpawnTimer.start()
		var spawn = load("res://Characters/Archer_Enemy.tscn")
		var new_spawn = spawn.instance()
		new_spawn.player = player
		new_spawn.connect("shoot", self, "handle_enemy_bullet_spawned")
		add_child(new_spawn)


func _on_SpawnTimer_timeout():
	$SpawnTimer.stop()
	can_spawn = true


func handle_enemy_bullet_spawned(bullet: EnemyShot, a_position: Vector2, direction: Vector2):
	add_child(bullet)
	bullet.global_position = a_position
	bullet.set_direction(direction)
