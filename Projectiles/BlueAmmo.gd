extends Area2D
class_name ammo
var type

signal picked_up

var item_name

# Called when the node enters the scene tree for the first time.
func _ready():
	type = 1
	item_name = "BlueOrb"

func _on_BlueAmmo_body_entered(body):
	#print("*(())")
	queue_free()
	emit_signal("picked_up", type)
	PlayerInventory.add_item(item_name, 6)
