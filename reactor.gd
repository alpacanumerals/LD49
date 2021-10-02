extends ColorRect


var yan:int = 100
var tsun:int = 100


# Called when the node enters the scene tree for the first time.
func _ready():
    var list_button_load = load("res://witchbutton.tscn") #Dialogue test
    var list_button = list_button_load.instance()
    get_node("MarginContainer/VBoxContainer/HBoxContainer/ListPanel/WitchList").add_child(list_button)
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass


func _on_Button_button_down():
    switcher.playClick()
    
func _on_Button_pressed():
    util.summon()
    pass # Replace with function body.
