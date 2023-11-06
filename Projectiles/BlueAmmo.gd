extends Area2D
class_name ammo
var type

signal picked_up
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var item_name

# Called when the node enters the scene tree for the first time.
func _ready():
	type = 0
	item_name = "Laser Blast"

func _on_BlueAmmo_body_entered(body):
	#print("*(())")
	queue_free()
	emit_signal("picked_up", type)
	PlayerInventory.add_item(item_name, 10)
