extends Control

# Variables to control the scaling behavior
@export var min_scale: float = 0.8
@export var max_scale: float = 1.2
@export var speed: float = 1.0

# Internal variables
var scaling_up: bool = true
var current_scale_factor: float = 1.0

func _process(delta):
	# Determine the direction of scaling
	if scaling_up:
		current_scale_factor += speed * delta
		if current_scale_factor > max_scale:
			current_scale_factor = max_scale
			scaling_up = false
	else:
		current_scale_factor -= speed * delta
		if current_scale_factor < min_scale:
			current_scale_factor = min_scale
			scaling_up = true
	
	# Apply the new scale to the node
	scale = Vector2(current_scale_factor, current_scale_factor)
