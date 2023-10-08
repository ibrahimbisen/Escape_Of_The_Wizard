extends FireBall
class_name Shotgun
onready var rotation_degree


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction.rotated(rotation_degree) * speed * delta
