extends Node

var file_dict

func _ready():
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
    
    
func randomFrom(array):
    return array[randi() % array.size()]

func percentChance(percent):
    if randi()%100+1 <= percent:
        return true
    return false


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
