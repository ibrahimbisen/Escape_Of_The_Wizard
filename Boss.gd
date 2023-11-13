extends Enemy
onready var spawner = $Spawner

onready var turret1 = $Turret
onready var turret2 = $Turret2

onready var rocket1 = $RocketTurret
onready var rocket2 = $RocketTurret2

onready var backturret = $BackTurret
onready var backturret2 = $BackTurret2

# Called when the node enters the scene tree for the first time.
func _ready():
	spawner.boss = self
	#print(player, self.player)
	health = 300
	#spawner.player = self.player
	#print("***",spawner.player)
	#print(player)
	#turret1.player = self.player
	#print(")))", turret1.player)
	#turret2.player = self.player
	turret1.connect("shoot", self, "handle_enemy_bullet_spawned")
	turret2.connect("shoot", self, "handle_enemy_bullet_spawned")
	
	#rocket1.player = self.player
	#rocket2.player = self.player
	rocket1.connect("rocket", self, "handle_enemy_rocket_spawned")
	rocket2.connect("rocket", self, "handle_enemy_rocket_spawned")
	
	#backturret.player = self.player
	backturret.connect("shoot", self, "handle_enemy_bullet_spawned")
	backturret2.connect("shoot", self, "handle_enemy_bullet_spawned")


func handle_enemy_rocket_spawned(bullet: Explosive, a_position: Vector2, direction: Vector2):
	add_child(bullet)
	bullet.global_position = a_position
	bullet.set_direction(direction)
	
func handle_enemy_bullet_spawned(bullet: EnemyShot, a_position: Vector2, direction: Vector2):
	add_child(bullet)
	bullet.global_position = a_position
	bullet.set_direction(direction)
