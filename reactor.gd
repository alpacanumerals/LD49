extends ColorRect


var yan:int = 100
var tsun:int = 100


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass


func _on_Button_button_down():
    switcher.playClick()
    
func _on_Button_pressed():
    util.summon()
    pass # Replace with function body.
