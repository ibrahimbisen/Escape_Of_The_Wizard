extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var timer = $ExtractionTimer
var entered = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if entered == true:
		if Input.is_action_just_pressed("Shoot"):
			timer.start()

func _on_Extraction_body_entered(body: PhysicsBody2D):
	entered = true


func _on_Extraction_body_exited(body: PhysicsBody2D):
	entered = false
	timer.stop()

func _on_Timer_timeout():
	get_tree().change_scene("res://UI/Menu.tscn")
