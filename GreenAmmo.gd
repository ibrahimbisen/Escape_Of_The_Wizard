extends ammo


# Called when the node enters the scene tree for the first time.
func _ready():
	type = 2
	$Sprite.texture = load("res://Assets/Inventory/item_icons/" + "GreenOrb" + ".png")

	item_name = "GreenOrb"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_GreenAmmo_body_entered(body):
	queue_free()
	emit_signal("picked_up", type)
	PlayerInventory.add_item(item_name, 7)
