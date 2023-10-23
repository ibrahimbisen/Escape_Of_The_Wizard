extends Node

signal active_item_updated

const SlotClass = preload("res://UI/Slot.gd")
const ItemClass = preload("res://UI/Item.gd")
const NUM_INVENTORY_SLOTS = 20
const NUM_HOTBAR_SLOTS = 9

var active_item_slot = 0

var inventory = {
	0: ["BlueOrb", 10],  #--> slot_index: [item_name, item_quantity]
	1: ["RedOrb", 10], #--> slot_index: [item_name, item_quantity]
	2: ["GreenOrb", 10],
	3: ["RedOrb", 10], 
	4: ["BlueOrb", 10],
	5: ["RedOrb", 10], #--> slot_index: [item_name, item_quantity]
	6: ["GreenOrb", 10],
	7: ["BlueOrb", 10], 
	8: ["GreenOrb", 10],
	
}
var hotbar = {
	0: ["BlueOrb", 10],  #--> slot_index: [item_name, item_quantity]
	1: ["RedOrb", 10], #--> slot_index: [item_name, item_quantity]
	2: ["GreenOrb", 10],
	3: ["RedOrb", 10], 
	4: ["BlueOrb", 10],
	5: ["RedOrb", 10], #--> slot_index: [item_name, item_quantity]
	6: ["GreenOrb", 10],
	7: ["BlueOrb", 10], 
	8: ["GreenOrb", 10],
}
func add_item(item_name, item_quantity):
	for item in inventory:
		if inventory[item][0] == item_name:
			var stack_size = int(JsonData.item_data[item_name]["StackSize"])
			var able_to_add = stack_size - inventory[item][1]
			if able_to_add >= item_quantity:
				inventory[item][1] += item_quantity
				
				return
			else:
				inventory[item][1] += able_to_add
				item_quantity = item_quantity - able_to_add
	
	# item doesn't exist in inventory yet, so add it to an empty slot
	for i in range(NUM_INVENTORY_SLOTS):
		if inventory.has(i) == false:
			inventory[i] = [item_name, item_quantity]
			return
func add_item_to_empty_slot(item: ItemClass, slot: SlotClass):
	inventory[slot.slot_index] = [item.item_name, item.item_quantity]
func add_item_quantity(slot: SlotClass, quantity_to_add: int):
	inventory[slot.slot_index][1]+ quantity_to_add
func _ready():
	pass # Replace with function body.

func remove_item(slot: SlotClass):		
	inventory.erase(slot.slot_index)	
### Hotbar Related Functions
func active_item_scroll_up() -> void:
	active_item_slot = (active_item_slot + 1) % NUM_HOTBAR_SLOTS
	emit_signal("active_item_updated")

func active_item_scroll_down() -> void:
	if active_item_slot == 0:
		active_item_slot = NUM_HOTBAR_SLOTS - 1
	else:
		active_item_slot -= 1
	emit_signal("active_item_updated")
