extends Area2D


onready var timer = $ExtractionTimer
var entered = false


func _on_Timer_timeout():
	get_tree().change_scene("res://Main Scenes/Level 2.tscn")



var first_collision_ignored = false  # <-- Flag for first collision


func _on_Extraction_body_entered(body: PhysicsBody2D):
	if not first_collision_ignored:
		first_collision_ignored = true 
		return
	entered = true
	if entered:
		print("Entered the extraction area.")
		timer.start()

func _on_Extraction_body_exited(body: PhysicsBody2D):
	if not first_collision_ignored: 
		return

	entered = false
	if entered:
		print("Exited the extraction area.")
		timer.stop()



