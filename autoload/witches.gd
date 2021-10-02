extends Node

var witch_array = []
var witch_index = 0

#name, stars, facefile, ATK, DEF, ability index (0 for now)
#index 0, 1, 2 always Gertrude, Manako and Yuli

func _ready():
    pause_mode = Node.PAUSE_MODE_PROCESS
    pass # Replace with function body.

func init_witches():
    var roll = util.d100()
    var atk:int
    var def:int
    if roll <= 35:
        atk = 300 + util.d6()*50
        def = 500 + util.d6()*50
    elif roll <= 65:
        atk = 400 + util.d6()*50
        def = 400 + util.d6()*50        
    else:
        atk = 500 + util.d6()*50
        def = 300 + util.d6()*50        
    var gertrude = ["Gertrude",1,"gertrude",atk,def,0]
    
    roll = util.d100()
    if roll <= 40:
        atk = 200 + util.d6()*50
        def = 600 + util.d6()*50
    elif roll <= 60:
        atk = 400 + util.d6()*50
        def = 400 + util.d6()*50        
    else:
        atk = 600 + util.d6()*50
        def = 200 + util.d6()*50    
    var manako = ["Manako",1,"manako",atk,def,0]
    
    roll = util.d100()
    if roll <= 30:
        atk = 450 + util.d6()*50
        def = 750 + util.d6()*50
    elif roll <= 70:
        atk = 600 + util.d6()*50
        def = 600 + util.d6()*50        
    else:
        atk = 750 + util.d6()*50
        def = 450 + util.d6()*50  
    var yuli = ["Yuli",2,"yuli",atk,def,0]
    witch_array.append(gertrude)
    witch_array.append(manako)
    witch_array.append(yuli)

func witch_carding():
    var witch_card_load = load("res://witchcard.tscn") #Dialogue test
    var witch_card = witch_card_load.instance()
    get_viewport().add_child(witch_card)

func witch_summon(tsun, yan, dere):
    var summoning_load = load("res://summon.tscn") #Dialogue test
    var summoning = summoning_load.instance()
    get_viewport().add_child(summoning)    
    pass
