extends CanvasLayer
@export var labelText:RichTextLabel
@export var currentText:String = "Hello"
@export var currentTimeToWaitUntilNextLine:float = 4
@export var confirmButton:Node
@export var afterString:String = "Anything Else?"
var currentTimeWaiting = 0
var currentLineQueue = 0;
var maxLineQueue = 0;
var currentLines = []

@export var button_1_lines:Array = ['I chose the book Algorithims of Oppression because I thought it would be relevant to my study.', "I learned about how the American Healthcare system's technology was engineered to systematically put down minorities and others it's creators found undeserving of basic human rights.", 'It depressed me greatly.']
@export var button_2_lines:Array = []
@export var button_3_lines:Array = []
@export var button_4_lines:Array = []
# Called when the node enters the scene tree for the first time.
func _ready():
	confirmButton.visible = false;
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(labelText.visible_ratio<1):
		confirmButton.visible= false;
		labelText.visible_ratio +=0.1*currentTimeToWaitUntilNextLine*delta;
		if(labelText.visible_ratio>0.98):
			if(currentLines.size()>1):
				confirmButton.visible = true
			labelText.visible_ratio = 1;
		if(labelText.visible_ratio>0.25):
			_check_for_next_line()
	else:
		_check_for_next_line()
			
			
	labelText.text = currentText;
	
	pass

func _say_new_lines(lines):
	currentLineQueue =0;
	labelText.visible_ratio = 0;
	currentLines = lines;
	currentText = currentLines[currentLineQueue];

func _check_for_next_line(): 
	if Input.is_action_just_released("click"):
			if (currentLineQueue<currentLines.size()-1):
				labelText.visible_ratio = 0;
				currentLineQueue+=1;
				currentText = currentLines[currentLineQueue]
			else:
				_say_new_lines([afterString])

func _on_book_button_pressed():
	var newLines = button_1_lines
	_say_new_lines(newLines)
	pass # Replace with function body.


func _on_six_months_button_pressed():
	var newLines = button_2_lines
	_say_new_lines(newLines)
	pass # Replace with function body.


func _on_special_button_pressed():
	var newLines = button_3_lines
	_say_new_lines(newLines)
	pass # Replace with function body.
