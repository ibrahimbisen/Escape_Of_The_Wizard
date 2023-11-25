extends Enemy
#onready var spawner = $Spawner
onready var turret1 = $Turret
onready var turret2 = $Turret2

onready var rocket1 = $RocketTurret

onready var turret3 = $Turret3

onready var backturret = $BackTurret
onready var backturret2 = $BackTurret2

# Called when the node enters the scene tree for the first time.
func _ready():
	speed = 110
	turning_speed = 0.015
	$Turret/GunTimer.wait_time = 1
	$Turret2/GunTimer.wait_time = 1
	$Turret3/GunTimer.wait_time = 1
	$BackTurret/GunTimer.wait_time = 1
	$BackTurret2/GunTimer.wait_time = 1
	$RocketTurret/GunTimer.wait_time = 2
	
	#spawner.boss = self
	#print(player, self.player)
	health = 420
	#spawner.player = self.player
	#print("***",spawner.player)
	#print(player)
	#turret1.player = self.player
	#print(")))", turret1.player)
	#turret2.player = self.player
	turret1.connect("shoot", self, "handle_enemy_bullet_spawned")
	turret2.connect("shoot", self, "handle_enemy_bullet_spawned")
	turret3.connect("shoot", self, "handle_enemy_bullet_spawned")
	
	#rocket1.player = self.player
	#rocket2.player = self.player
	rocket1.connect("rocket", self, "handle_enemy_rocket_spawned")
	#rocket2.connect("rocket", self, "handle_enemy_rocket_spawned")
	
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

func _physics_process(delta):
	print("1tick")
	position += direction * speed * delta
