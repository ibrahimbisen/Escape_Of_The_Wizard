extends RayCast2D
class_name Laser

var is_casting := false setget set_is_casting
onready var killTimer = $KillTimer


# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(false)


func _physics_process(delta):
	force_raycast_update()
	
	if is_colliding():
		var collider = self.get_collider()
		if collider.has_method("handle_hit"):
			#print(collider)
			collider.handle_hit()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func set_is_casting(cast):
	is_casting = cast
	killTimer.start()
	set_physics_process(is_casting)
	

func _on_KillTimer_timeout():
	killTimer.stop()
	queue_free()
