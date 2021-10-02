extends MarginContainer

# Called to display a Witch.
var progress:bool = false

var fetched_witch = []

# Called when the node enters the scene tree for the first time.
func _ready():
    pause_mode = Node.PAUSE_MODE_PROCESS
    get_tree().paused = true
    #Now, fetch the witch.
    #[namae, stars, facefile, ATK, DEF, ability index (0 for now)]
    fetched_witch = witches.witch_array[witches.witch_index]
    get_node("Card/MarginContainer/VBoxContainer/MarginContainer/Label")
    get_node("Card/MarginContainer/VBoxContainer/WaifuPic/Stars")
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
