extends VBoxContainer
var is_paused = false setget set_is_paused

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		self.is_paused = !is_paused
		
		
		


func _on_Menu_pressed():
	get_tree().change_scene("res://UI/Menu.tscn")
	self.is_paused = !is_paused


func _on_Quit_pressed():
	get_tree().quit()


func _on_Resume_pressed():
	self.is_paused = !is_paused
	get_tree().paused = false
	
