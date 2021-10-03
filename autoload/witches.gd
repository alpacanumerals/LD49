extends Node

var witch_array = []
var witch_index = 0
var witch_names = []
var witch_faces = []
var witch_badend_faces = []

var summon_name
var summon_stars
var summon_face
var summon_ATK:int
var summon_DEF:int
var summon_abindex = 0

#name, stars, facefile, ATK, DEF, ability index (0 for now)
#index 0, 1, 2 always Gertrude, Manako and Yuli

func _ready():
    pause_mode = Node.PAUSE_MODE_PROCESS

func loadNames():
    var file = File.new()
    witch_names.clear()
    file.open("res://loader/witchnames.txt", File.READ)
    witch_names = JSON.parse(file.get_as_text()).result
    file.close()

func prepFaces():
    for i in range(30):
        var path = "res://assets_faces/w"+String(i)+".jpeg"
        witch_faces.append(path)
    for j in range(3):
        var path = "res://assets_faces/z"+String(j)+".jpeg"
        witch_badend_faces.append(path)

func init_witches():
    prepFaces()
    loadNames()
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

func witch_summon():
    summon_name = util.randomFrom(witch_names)

    var roll = util.d100()
    if roll <= 5:
        summon_stars = 5
    elif roll <= 25:
        summon_stars = 4
    elif roll <= 50:
        summon_stars = 3
    elif roll <= 75:
        summon_stars = 2
    else:
        summon_stars = 1
    
    summon_face = util.randomFrom(witch_faces)
    summon_ATK = 250+summon_stars*250+util.d6(summon_stars)*50
    summon_DEF = 250+summon_stars*250+util.d6(summon_stars)*50

    witch_array.append([summon_name, summon_stars, summon_face, summon_ATK, summon_DEF, summon_abindex])
    
func witch_summon2():
    var summoning_load = load("res://summon.tscn")
    var summoning = summoning_load.instance()
    get_viewport().add_child(summoning)    
    pass
