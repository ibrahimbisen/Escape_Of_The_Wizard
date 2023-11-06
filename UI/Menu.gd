extends VBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Start_pressed():
	#$Click.play()
	Global.lives = Global.max_lives
	#PlayerInventory.active_item_slot = 0
	return get_tree().change_scene("res://Main Scenes/Level 1.tscn") # Replace with function body.
	

func _on_Quit_pressed():
	$Click.play()
	return get_tree().quit()


func _on_Tutorial_pressed():
	$Click.play()
	Global.lives = Global.max_lives
	return get_tree().change_scene("res://Main Scenes/Tutorial.tscn")


func _on_Menu_pressed():
	$Click.play()
	return get_tree().change_scene("res://UI/Menu.tscn")
	
	


	


func _on_Main_Menu_pressed():
	 return get_tree().change_scene("res://UI/Menu.tscn")
