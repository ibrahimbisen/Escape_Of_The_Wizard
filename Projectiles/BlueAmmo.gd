extends Area2D
class_name ammo
var type

signal picked_up
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	type = 1


func _on_BlueAmmo_body_entered(body):
	#print("*(())")
	queue_free()
	emit_signal("picked_up", type)
