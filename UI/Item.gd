extends Node2D

var item_name
var item_quantity

# Called when the node enters the scene tree for the first time.
func _ready():
	var rand_val = randi()%3	
	if rand_val == 0:
		item_name = "Fire Ball"
	elif rand_val == 1:
		item_name = "Laser Blast"
	elif rand_val == 2:
		item_name = "Crossbow"
		
	$TextureRect.texture = load("res://Assets/Inventory/item_icons/" + item_name + ".png")
	var stack_size = int(JsonData.item_data[item_name]["StackSize"])
	item_quantity = randi() % stack_size + 1

	
func set_item(nm, qt):
	item_name = nm
	item_quantity = qt
	$TextureRect.texture = load("res://Assets/Inventory/item_icons/" + item_name + ".png")

	#$TextureRect.texture = load("res://Assets/Inventory/item_icons/" + item_name + ".png")
	
	#var stack_size = int(JsonData.item_data[item_name]["StackSize"])
	item_quantity = qt
	
	$Label.text = String(item_quantity)
