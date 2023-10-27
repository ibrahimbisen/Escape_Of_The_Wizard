extends ammo


# Called when the node enters the scene tree for the first time.
func _ready():
	type = 2
	$Sprite.texture = load("res://Assets/Inventory/item_icons/" + "GreenOrb" + ".png")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
