extends Sprite2D
@export var pupil:Sprite2D

# The fixed radius that the object can move away from its origin point
@export var radius: float = 100.0
@export var tracking_offset:Vector2 = Vector2(100,0)
# The origin point from which the object moves
var origin_position: Vector2

func _ready():
	# Store the initial position as the origin point
	origin_position = pupil.position

func _process(delta):
	# Get the global mouse position
	var mouse_position = get_local_mouse_position()

	# Calculate the direction vector from the origin to the mouse
	var direction = (mouse_position+tracking_offset) - origin_position
	
	# If the direction vector is longer than the radius, normalize and scale it
	if direction.length() > radius:
		direction = direction.normalized() * radius

	# Set the object's new position
	pupil.position = origin_position + direction
