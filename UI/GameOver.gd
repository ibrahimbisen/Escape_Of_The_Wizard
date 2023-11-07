extends VBoxContainer

func _ready():
	pass # Replace with function body.

func _on_Quit_pressed():
	$Click.play()
	return get_tree().quit()

func _on_Main_Menu_pressed():
	 return get_tree().change_scene("res://UI/Menu.tscn")


func _on_Start_over_pressed():
	$Click.play()
	Global.lives = Global.max_lives
	PlayerInventory.active_item_slot = 0
	return get_tree().change_scene("res://Main Scenes/Level 1.tscn") 
