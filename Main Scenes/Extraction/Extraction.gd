extends Area2D


onready var timer = $ExtractionTimer
#var entered = false

# DO NOT DELETE
# DO NOT DELETE
# DO NOT DELETE
# DO NOT DELETE

#func _ready():
#	connect("body_entered", self, "_on_Extraction_body_entered")
#	connect("body_exited", self, "_on_Extraction_body_exited")
#	timer.connect("timeout", self, "_on_Timer_timeout")
func _on_Timer_timeout():
	get_tree().change_scene("res://UI/Menu.tscn")
#func _on_Extraction_body_entered(body: PhysicsBody2D):
#	entered = true
#	if entered:
#		print("Entered the extraction area.")
#		timer.start()
#func _on_Extraction_body_exited(body: PhysicsBody2D):
#	entered = false
#	if entered:
#		print("Exited the extraction area.")
#		timer.stop()

export(PackedScene) var target_scene

func _input(event):
	if event.is_action_pressed("Enter"):
		if !target_scene:
			timer.start()
	
		if get_overlapping_bodies().size() >= 1 or get_overlapping_areas().size() >= 1:
			pass
