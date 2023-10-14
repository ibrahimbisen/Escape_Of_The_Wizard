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
	get_tree().change_scene("res://Main Scenes/Main.tscn") # Replace with function body.


func _on_Quit_pressed():
	get_tree().quit()


func _on_Tutorial_pressed():
	get_tree().change_scene("res://Main Scenes/Main scene for the tutorial.tscn")


func _on_Menu_pressed():
	get_tree().change_scene("res://UI/Menu.tscn")

