extends Node2D
export (PackedScene) var Fireball
onready var end_of_gun = $EndofGun
onready var gunpoint = $GunDirection

signal player_fired_bullet

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func Shoot():
	var fireball_instance = Fireball.instance()
	var direction = (gunpoint.global_transform.origin - end_of_gun.global_transform.origin).normalized()
	emit_signal("player_fired_bullet", fireball_instance,end_of_gun.global_position, direction)


func Big_Shoot():
	var fireball_instance = Fireball.instance()
	var direction = (gunpoint.global_transform.origin - end_of_gun.global_transform.origin).normalized()
	fireball_instance.scale(2)
	emit_signal("player_fired_bullet", fireball_instance,end_of_gun.global_position, direction)
