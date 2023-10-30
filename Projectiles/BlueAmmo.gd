extends Area2D
class_name ammo
var type
const ItemClass = preload("res://UI/Item.gd")

signal picked_up

var item_name
var Item_update = false

# Called when the node enters the scene tree for the first time.
func _ready():
	type = 1

	item_name = "BlueOrb"
	
func _on_BlueAmmo_body_entered(body):
	#print("*(())")
	queue_free()
	emit_signal("picked_up", type)
	PlayerInventory.add_item(item_name, 6)
	
	


