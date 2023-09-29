extends Node2D
var Projectile = load("res://projectile.tscn")
var Projectiles = Array()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("shoot"):
		var projectile = Projectile.instantiate()
		Projectiles.append(projectile)
