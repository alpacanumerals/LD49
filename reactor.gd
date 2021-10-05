extends ColorRect

var vessel
var power_label
var shield_label
var stab_label
var tsun_label
var yan_label
var dere_label

# Called when the node enters the scene tree for the first time.
func _ready():
    witches.witch_array = []
    var list_button_load = load("res://witch.tscn")
    var list_button_0 = list_button_load.instance()
    get_node("MarginContainer/VBoxContainer/HBoxContainer/ListPanel/Panel/WitchList").add_child(list_button_0)
    list_button_0.initialise(0)
    
    var list_button_1 = list_button_load.instance()
    get_node("MarginContainer/VBoxContainer/HBoxContainer/ListPanel/Panel/WitchList").add_child(list_button_1)
    list_button_1.initialise(1)
    
    var list_button_2 = list_button_load.instance()
    get_node("MarginContainer/VBoxContainer/HBoxContainer/ListPanel/Panel/WitchList").add_child(list_button_2)
    list_button_2.initialise(2)
    
    magic.init_values()
    witches.set_minimum_energy()
    if settings.tutorial == true:
        settings.tutoring()
    magic.gamestart = true

func _on_Button_button_down():
    switcher.playClick()
