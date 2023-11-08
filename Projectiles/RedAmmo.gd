extends ammo


func _ready():
	type = 2
	
	item_name = "Fire Ball"

func _on_RedAmmo_body_entered(body):
	queue_free()
	emit_signal("picked_up", type)
	PlayerInventory.add_item(item_name, 2)
