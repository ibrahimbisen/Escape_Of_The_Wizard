extends Area2D
class_name key
signal key_picked_up

onready var door


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Key_body_entered(body):
	emit_signal("key_picked_up", door)
	queue_free()
