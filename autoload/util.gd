extends Node

var file_dict

func _ready():
    pause_mode = Node.PAUSE_MODE_PROCESS
    randomize()
    loadJSONs()

func loadJSONs():
    var file = File.new()
    file.open("res://loader/loader.txt", File.READ)
    var loadlist = JSON.parse(file.get_as_text()).result
    file.close()
    var loadlist_size = loadlist.size()
    for i in range(loadlist_size):
        var file_name = filePath(loadlist[i])
        file = File.new()
        file.open((file_name), File.READ)
        #file_dict dictionary gets file's name as a key and its array appended to it.
        file_dict[loadlist[i]] = JSON.parse(file.get_as_text()).result

func filePath(file):
    return "res://loader/"+file+".txt"
    
#RANDOM
func randomFrom(array):
    var roll = randi() % array.size()
    var value = array[roll]
    array.remove(roll)
    return value

func percentChance(percent):
    if randi()%100+1 <= percent:
        return true
    return false

#DICE
func d100(dice:int = 1):
    var result:int = 0
    for i in range(dice):
        result = result + randi()%100+1 
    return result
    
func d6(dice:int = 1):
    var result:int = 0
    for i in range(dice):
        result = result + randi()%6+1
    return result

#Dialogue
func dialogue():
    var dialogue_box_load = load("res://dialoguebox.tscn") #Dialogue test
    var dialogue_box = dialogue_box_load.instance()
    get_viewport().add_child(dialogue_box)

