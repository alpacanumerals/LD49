extends MarginContainer

# Called to display a Witch.
var progress:bool = false
var summoned_witch = witches.witch_array.back()

# Called when the node enters the scene tree for the first time.
func _ready():
    pause_mode = Node.PAUSE_MODE_PROCESS
    get_tree().paused = true
    get_node("Card/MarginContainer/VBoxContainer/WaifuName").text = "???"
    get_node("Card/MarginContainer/VBoxContainer/WaifuPic").texture = load("res://assets/sil1.png")
    $Blip.play()
    yield(get_tree().create_timer(0.5), "timeout")
    get_node("Card/MarginContainer/VBoxContainer/WaifuPic").texture = load("res://assets/sil2.png")
    $Blip.play()
    yield(get_tree().create_timer(0.5), "timeout")
    get_node("Card/MarginContainer/VBoxContainer/WaifuPic").texture = load("res://assets/sil3.png")
    $Blip.play()
    yield(get_tree().create_timer(0.5), "timeout")
    get_node("Card/MarginContainer/VBoxContainer/WaifuPic").texture = load("res://assets/sil1.png")
    $Blip.play()
    yield(get_tree().create_timer(0.5), "timeout")
    get_node("Card/MarginContainer/VBoxContainer/WaifuPic").texture = load("res://assets/sil2.png")
    $Blip.play()
    yield(get_tree().create_timer(0.3), "timeout")
    get_node("Card/MarginContainer/VBoxContainer/WaifuPic").texture = load("res://assets/sil3.png")
    $Blip.play()
    yield(get_tree().create_timer(0.3), "timeout")
    get_node("Card/MarginContainer/VBoxContainer/WaifuPic").texture = load("res://assets/sil1.png")
    $Blip.play()
    yield(get_tree().create_timer(0.3), "timeout")
    get_node("Card/MarginContainer/VBoxContainer/WaifuPic").texture = load("res://assets/sil2.png")
    $Blip.play()
    yield(get_tree().create_timer(1), "timeout")
    #Now, SUMMON THE WITCH!
    #namae, stars, facefile, ATK, DEF, ability index (0 for now)
    get_node("Card/MarginContainer/VBoxContainer/WaifuName").text = summoned_witch[0]
    get_node("Card/MarginContainer/VBoxContainer/WaifuPic/Stars").texture = load("res://assets/star"+String(summoned_witch[1])+".png")
    get_node("Card/MarginContainer/VBoxContainer/WaifuPic").texture = load(summoned_witch[2])
    get_node("Card/MarginContainer/VBoxContainer/HBoxContainer/AtkValue").text = String(summoned_witch[3])
    get_node("Card/MarginContainer/VBoxContainer/HBoxContainer/DefValue").text = String(summoned_witch[4])
    
    yield(get_tree().create_timer(0.5), "timeout")
    if summoned_witch[1] == 1 or summoned_witch[1] == 2:
        $Jingle1.play()
    elif summoned_witch[1] == 3 or summoned_witch[1] == 4:
        $Jingle2.play()
    else:
        $Jingle3.play()
    yield(get_tree().create_timer(0.75), "timeout")
    progress = true

func _input(event):
    if event is InputEventMouseButton and progress == true:
        if event.button_index == BUTTON_LEFT and event.pressed:
            switcher.playClick()
            get_tree().paused = false
            if (witches.witch_array.size() >= 13):
                switcher.switchScene("res://victoryscreen.tscn")
            queue_free()
