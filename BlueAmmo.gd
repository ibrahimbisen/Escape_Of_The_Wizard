extends Area2D

var type = 3
signal picked_up


func _on_BlueAmmo_body_entered(body):
	emit_signal("picked_up", type)
	queue_free()
