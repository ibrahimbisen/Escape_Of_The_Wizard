extends FireBall
class_name Explosive


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_KillTimer_timeout():
	$ExplosionTimer.start()
	$Explosion.show()
	#print("explode")
	$Sprite.hide()
	self.direction = Vector2.ZERO


func _on_ExplosionTimer_timeout():
	$ExplosionTimer.stop()
	queue_free()


func _on_FireBall_body_entered(body):
	if body.has_method("handle_hit"):
		body.handle_hit()
		$ExplosionTimer.start()
		$Explosion.show()
		$Sprite.hide()
		self.direction = Vector2.ZERO


func _on_Explosion_body_entered(body):
	if body.has_method("handle_hit"):
		#print("&")
		body.handle_hit()


func _on_Explosive_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	$ExplosionTimer.start()
	$Explosion.show()
	$Sprite.hide()
	self.direction = Vector2.ZERO
