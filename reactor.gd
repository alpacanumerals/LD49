extends ColorRect

var tsun:int = 100
var yan:int = 100
var dere:int = 100

var stability: int = 100
var power: int = 0
var shielding: int = 100

var vessel
var power_label
var shield_label
var stab_label
var tsun_label
var yan_label
var dere_label

var reactor_tick_size: float = 0.1
var reactor_tick_counter: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
    var list_button_load = load("res://witch.tscn") #Dialogue test
    var list_button = list_button_load.instance()
    get_node("MarginContainer/VBoxContainer/HBoxContainer/ListPanel/WitchList").add_child(list_button)
    vessel = get_node("MarginContainer/VBoxContainer/HBoxContainer/VerticalDistance/ContainmentVessel")
    power_label = get_node("MarginContainer/VBoxContainer/HBoxContainer/MainScreen/PowerLabel")
    shield_label = get_node("MarginContainer/VBoxContainer/HBoxContainer/MainScreen/ShieldLabel")
    stab_label = get_node("MarginContainer/VBoxContainer/HBoxContainer/MainScreen/StabLabel")
    tsun_label = get_node("MarginContainer/VBoxContainer/HBoxContainer/MainScreen/TsunLabel")
    yan_label = get_node("MarginContainer/VBoxContainer/HBoxContainer/MainScreen/YanLabel")
    dere_label = get_node("MarginContainer/VBoxContainer/HBoxContainer/MainScreen/DereLabel")

func _physics_process(delta):
    reactor_tick_counter += delta
    if reactor_tick_counter > reactor_tick_size:
        reactor_tick_counter = 0.0
        update_stability()
    update_labels()

func update_stability():        
    power = vessel.depth/4
    var excess = power - shielding
    var stab_d = 0
    if excess > 0:
        stab_d = -excess
    else:
        stab_d = 1
    stability += stab_d
    if stability > 100:
        stability = 100
    elif stability < 0:
        print("boom!")
        stability = 0
    
func update_labels():
    power_label.set_value(power)
    shield_label.set_value(shielding)
    stab_label.set_value(stability)
    tsun_label.set_value(tsun)
    yan_label.set_value(yan)
    dere_label.set_value(dere)

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
