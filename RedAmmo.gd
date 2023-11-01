extends ammo


# Called when the node enters the scene tree for the first time.
func _ready():
	type = 0
	$Sprite.texture = load("res://Assets/Inventory/item_icons/" + "RedOrb" + ".png")

	item_name = "Fire Ball"

	

func _on_RedAmmo_body_entered(body):
	queue_free()
	emit_signal("picked_up", type)
	PlayerInventory.add_item(item_name, 20)
