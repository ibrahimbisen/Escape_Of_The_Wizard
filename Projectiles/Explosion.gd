extends Area2D


func _on_Explosion_body_entered(body):
	if body.has_method("handle_hit"):
		body.handle_hit()
