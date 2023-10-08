extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _on_Explosion_body_entered(body):
	if body.has_method("handle_hit"):
		body.handle_hit()
