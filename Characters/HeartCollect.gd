extends Area2D

func _on_HeartCollect_body_entered(body):
	Global.heal()
	queue_free()
