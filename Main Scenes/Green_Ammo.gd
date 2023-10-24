extends Blue_Ammo

func _ready():
	$Sprite.texture = load("res://Assets/Inventory/item_icons/" + "GreenOrb" + ".png")
	type = 2
