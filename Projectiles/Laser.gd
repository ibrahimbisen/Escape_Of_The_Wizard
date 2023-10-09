extends RayCast2D
var is_casting := false setget set_is_casting
onready var cast_point
onready var killTimer = $KillTimer


# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(false)
	#$Line2D.add_point(Vector2(0,0))
	#$Line2D.points[1] = Vector2.ZERO
	

#func _unhandled_input(event):
#	if event is InputEventMouseButton:
#		self.is_casting = event.pressed


func _physics_process(delta: float) -> void:
	cast_point = cast_to
	force_raycast_update()
	
	if is_colliding():
		var collider = self.get_collider()
		$Line2D.points[0] = collider.global_position
		if collider.has_method("handle_hit"):
			collider.handle_hit()
		cast_point = to_local(get_collision_point())
#	if is_casting:
#		appear()
#	else:
#		disappear()
	
	#$Line2D.points[1] = cast_point


func set_is_casting(cast: bool) -> void:
	is_casting = cast
	killTimer.start()
	set_physics_process(is_casting)
	

#func appear():
#	$Tween.stop_all()
#	$Tween.interpolate_property($Line2D, "width", 0, 10.0, 0.2)
#	$Tween.start()
	

#func disappear():
#	$Tween.stop_all()
#	$Tween.interpolate_property($Line2D, "width", 0, 10.0, 0.1)
#	$Tween.start()

#func spawn(start: Vector2, end: Vector2):
#	print("x")
#	$Line2D.add_point(start)
#	$Line2D.add_point(end)
#	set_is_casting(true)
#	cast_point = end


func _on_KillTimer_timeout():
	killTimer.stop()
	queue_free()
