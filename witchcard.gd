extends MarginContainer

# Called to display a Witch.
var progress:bool = false

var fetched_witch = []

# Called when the node enters the scene tree for the first time.
func _ready():
    pause_mode = Node.PAUSE_MODE_PROCESS
    get_tree().paused = true
    #Now, fetch the witch.
    #namae, stars, facefile, ATK, DEF, ability index (0 for now)
    fetched_witch = witches.witch_array[witches.witch_index]
    get_node("Card/MarginContainer/VBoxContainer/WaifuName").text = fetched_witch[0]
    get_node("Card/MarginContainer/VBoxContainer/WaifuPic/Stars").texture = load("res://assets/star"+String(fetched_witch[1])+".png")
    if witches.witch_index > 2:
        get_node("Card/MarginContainer/VBoxContainer/WaifuPic").texture = load(fetched_witch[2])
    else:
        get_node("Card/MarginContainer/VBoxContainer/WaifuPic").texture = load("res://assets_faces/"+fetched_witch[2]+".png")
    get_node("Card/MarginContainer/VBoxContainer/HBoxContainer/AtkValue").text = String(fetched_witch[3])
    get_node("Card/MarginContainer/VBoxContainer/HBoxContainer/DefValue").text = String(fetched_witch[4])
    get_node("Card/MarginContainer/VBoxContainer/MarginContainer/FlavourText").text = "click to continue..."
    progress = true
    pass # Replace with function body.
    
func _input(event):
    if event is InputEventMouseButton and progress == true:
        if event.button_index == BUTTON_LEFT and event.pressed:
            switcher.playClick()
            get_tree().paused = false
            queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass
