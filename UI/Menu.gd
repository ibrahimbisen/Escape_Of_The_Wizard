extends VBoxContainer
onready var startmusic = $StartSFX


func _on_Start_pressed():
	Global.lives = Global.max_lives
	startmusic.play()
	return get_tree().change_scene("res://Main Scenes/Level 1.tscn") 	
	

func _on_Quit_pressed():
	return get_tree().quit()


func _on_Tutorial_pressed():
	startmusic.play()
	return get_tree().change_scene("res://Main Scenes/Tutorial.tscn")

func _on_Menu_pressed():
	return get_tree().change_scene("res://UI/Menu.tscn")


func _on_Main_Menu_pressed():
	 return get_tree().change_scene("res://UI/Menu.tscn")


func _on_Options_pressed():
	pass # Replace with function body.
