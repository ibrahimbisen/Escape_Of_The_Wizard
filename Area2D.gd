extends Area2D
class_name Blue_Ammo
signal pick_up
var type


# Called when the node enters the scene tree for the first time.
func _ready():
	type = 3


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Blue_Ammo_body_entered(body):
	print(body)
	emit_signal("pick_up", type)
	queue_free()
