extends ammo


# Called when the node enters the scene tree for the first time.
func _ready():
	type = 0
	$Sprite.texture = load("res://Assets/Inventory/item_icons/" + "RedOrb" + ".png")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
