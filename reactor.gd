extends ColorRect

var tsun:int = 100
var yan:int = 100
var dere:int = 100

# Called when the node enters the scene tree for the first time.
func _ready():
    var list_button_load = load("res://witch.tscn") #Dialogue test
    var list_button = list_button_load.instance()
    get_node("MarginContainer/VBoxContainer/HBoxContainer/ListPanel/WitchList").add_child(list_button)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass

func _on_Button_button_down():
    switcher.playClick()
    
func _on_Button_pressed():
    ###TESTING CODE FOR THE WITCH CARD###
    witches.witch_index = randi()%3
    witches.witch_carding()
    ###TESTING CODE FOR THE WITCH CARD###
    
    ###TESTING CODE FOR SUMMONING###
    witches.witch_summon(tsun, yan, dere)
    ###TESTING CODE FOR SUMMONING###
    
    pass # Replace with function body.
