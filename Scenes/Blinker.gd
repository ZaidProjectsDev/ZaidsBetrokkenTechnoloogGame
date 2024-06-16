extends TextureRect

var start_position:Vector2
var blinking = false;
var waitTime = 0.8;
var currentWait =0;
var canBlink = false;
var long_wait = 2;
@export var blink_speed:float = 16;
# Called when the node enters the scene tree for the first time.
func _ready():
	start_position = position;
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if blinking: 
		position+= Vector2(0,100)*blink_speed*delta
		if(position.y>=start_position.y+220): 
			blinking = false;
			canBlink = false;
	else:
		
		if(position.y<=start_position.y): 
			position = start_position;
			if(canBlink):
				blinking = true;
			else:
				if (currentWait<waitTime):
					currentWait+=delta;
				else:
					canBlink = true;
					currentWait = 0;
					if (waitTime<long_wait):
						waitTime = long_wait
					else:
						waitTime = 0.8
		else:
			position+= Vector2(0,-100)*blink_speed*delta
	pass
