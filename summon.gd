extends MarginContainer

# Called to display a Witch.
var progress:bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
    pause_mode = Node.PAUSE_MODE_PROCESS
    get_tree().paused = true
    #Now, SUMMON THE WITCH!
    #namae, stars, facefile, ATK, DEF, ability index (0 for now)
    
    get_node("Card/MarginContainer/VBoxContainer/WaifuName").text = witches.witch_summon[0]
    get_node("Card/MarginContainer/VBoxContainer/WaifuPic/Stars").texture = load("res://assets/star"+String(witches.witch_summon[1])+".png")
    get_node("Card/MarginContainer/VBoxContainer/WaifuPic").texture = load("res://assets_faces/"+witches.witch_summon[2]+".png")
    get_node("Card/MarginContainer/VBoxContainer/HBoxContainer/AtkValue").text = String(witches.witch_summon[3])
    get_node("Card/MarginContainer/VBoxContainer/HBoxContainer/DefValue").text = String(witches.witch_summon[4])
    
    yield(get_tree().create_timer(1), "timeout")
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
