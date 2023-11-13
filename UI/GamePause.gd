extends VBoxContainer
var is_paused = false setget set_is_paused


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
func set_is_paused(value):
	$resumemusic.play()
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		$resumemusic.play()
		$resumemusic.play()
		self.is_paused = !is_paused		


func _on_Menu_pressed():
	$resumemusic.play()
	get_tree().change_scene("res://UI/Menu.tscn")
	self.is_paused = !is_paused


func _on_Quit_pressed():
	$resumemusic.play()
	get_tree().quit()


func _on_Resume_pressed():
	$resumemusic.play()
	self.is_paused = !is_paused
	get_tree().paused = false


func _on_Options_pressed():
	$resumemusic.play()
	pass # Replace with function body.



func volume(bus_index, value):
	AudioServer.set_bus_volume_db(bus_index, linear2db(value)-30)

func _on_Master_Slider_value_changed(value):
	volume(0,value)
	#SaveData.master_vol = value
 

func _on_Music_Slider_value_changed(value):
	volume(1,value)
	#SaveData.music_vol = value

func _on_SFX_Slider_value_changed(value):
	volume(2,value)
	#SaveData.soundfx_vol = value
func _on_FullScreen_toggled(button_pressed):
	OS.set_window_fullscreen(button_pressed)

func _on_Volume_toggled(button_pressed):
	AudioServer.set_bus_mute(0,button_pressed)
