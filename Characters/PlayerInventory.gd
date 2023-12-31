extends Node

signal active_item_updated
signal inactive_item_updated

const SlotClass = preload("res://UI/Slot.gd")
const ItemClass = preload("res://UI/Item.gd")
const NUM_HOTBAR_SLOTS = 3

var active_item_slot = 0


var hotbar = {
	0: ["Laser Blast", 0],
	1: ["Crossbow", 0],
	2: ["Fire Ball", 0],
}


# TODO: First try to add to hotbar
func add_item(item_name, item_quantity):
	var slot_indices: Array = hotbar.keys()
	slot_indices.sort()
	for item in slot_indices:
		if hotbar[item][0] == item_name:
			hotbar[item][1] += item_quantity
			update_slot_visual(item, hotbar[item][0], hotbar[item][1])

func subtract_item(item_name, item_quantity):
	var slot_indices: Array = hotbar.keys()
	slot_indices.sort()
	for item in slot_indices:
		if hotbar[item][0] == item_name:
			hotbar[item][1] -= item_quantity
			update_slot_visual(item, hotbar[item][0], hotbar[item][1])
	# item doesn't exist in inventory yet, so add it to an empty slot
func reset_item(item_name, item_quantity):
	var slot_indices: Array = hotbar.keys()
	slot_indices.sort()
	for item in slot_indices:
		if hotbar[item][0] == item_name:
			hotbar[item][1] = item_quantity
			update_slot_visual(item, hotbar[item][0], hotbar[item][1])
# TODO: Make compatible with hotbar as well
func update_slot_visual(slot_index, item_name, new_quantity):
	var slot = get_tree().root.get_node("/root/Main/UI/Hotbar/HotbarSlots/HotbarSlot" + str(slot_index + 1))
	slot.item.set_item(item_name, new_quantity)

###
### Hotbar Related Functions
func active_item_scroll_up():
	if active_item_slot == 0:
		active_item_slot = NUM_HOTBAR_SLOTS - 1
	else:
		active_item_slot -= 1
	emit_signal("active_item_updated")

func active_item_scroll_down():
	active_item_slot = (active_item_slot + 1) % NUM_HOTBAR_SLOTS
	emit_signal("active_item_updated")
