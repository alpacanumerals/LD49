extends MarginContainer

# Called to display a Witch.
var progress:bool = false
var summoned_witch = witches.witch_array.back()

# Called when the node enters the scene tree for the first time.
func _ready():
    pause_mode = Node.PAUSE_MODE_PROCESS
    get_tree().paused = true
    #Now, SUMMON THE WITCH!
    #namae, stars, facefile, ATK, DEF, ability index (0 for now)
    
    get_node("Card/MarginContainer/VBoxContainer/WaifuName").text = summoned_witch[0]
    get_node("Card/MarginContainer/VBoxContainer/WaifuPic/Stars").texture = load("res://assets/star"+String(summoned_witch[1])+".png")
    get_node("Card/MarginContainer/VBoxContainer/WaifuPic").texture = load(summoned_witch[2])
    get_node("Card/MarginContainer/VBoxContainer/HBoxContainer/AtkValue").text = String(summoned_witch[3])
    get_node("Card/MarginContainer/VBoxContainer/HBoxContainer/DefValue").text = String(summoned_witch[4])
    
    yield(get_tree().create_timer(1), "timeout")
    progress = true

func _input(event):
    if event is InputEventMouseButton and progress == true:
        if event.button_index == BUTTON_LEFT and event.pressed:
            switcher.playClick()
            get_tree().paused = false
            queue_free()
