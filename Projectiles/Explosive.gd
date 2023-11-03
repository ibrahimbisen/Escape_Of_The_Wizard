extends FireBall
class_name Explosive
var explosion = load("res://Projectiles/Explosion.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


#explodes when fireball timer times out
func _on_KillTimer_timeout():
	$Explode.play()
	$ExplosionTimer.start()
	$Sprite.hide()
	self.direction = Vector2.ZERO
	$CollisionShape2D.disabled = true
	add_child(explosion.instance())


#removes explosion
func _on_ExplosionTimer_timeout():
	$ExplosionTimer.stop()
	queue_free()


#explodes when enemy is hit
func _on_FireBall_body_entered(body):
	if body.has_method("handle_hit"):
		body.handle_hit()
		$Explode.play()
		$ExplosionTimer.start()
		#$Explosion.show()
		$Sprite.hide()
		self.direction = Vector2.ZERO
	add_child(explosion.instance())
	$CollisionShape2D.disabled = true


#func _on_Explosion_body_entered(body):
#	if body.has_method("handle_hit"):
#		print("&")
#		body.handle_hit()


#explodes on collision with map item
func _on_Explosive_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	$Explode.play()
	$ExplosionTimer.start()
	#$Explosion.show()
	$Sprite.hide()
	self.direction = Vector2.ZERO
	add_child(explosion.instance())
	$CollisionShape2D.disabled = true
