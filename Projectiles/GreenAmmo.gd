extends ammo


func _ready():
	type = 1

	item_name = "Crossbow"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_GreenAmmo_body_entered(body):
	queue_free()
	emit_signal("picked_up", type)
	PlayerInventory.add_item(item_name, 5)
