extends Node2D

var item_name
var item_quantity

# Called when the node enters the scene tree for the first time.
func _ready():
		
	if randi() % 2 == 0:
		$TextureRect.texture = load("res://Assets/Inventory/item_icons/WandB.png")
	else:
		$TextureRect.texture = load("res://Assets/Inventory/item_icons/WandP.png")
		
func set_item(nm, qt):
	item_name = nm
	item_quantity = qt
	$TextureRect.texture = load("res://item_icons/" + item_name + ".png")
