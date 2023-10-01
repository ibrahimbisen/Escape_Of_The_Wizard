extends RigidBody2D
var speed = 30
var direction = Vector2.ZERO
var vision

# Called when the node enters the scene tree for the first time.
func _ready():
	vision = $Sight


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction * speed * delta
	vision.target_position = position
	if vision.is_colliding():
		direction = 
