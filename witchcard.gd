extends MarginContainer

# Called to display a Witch.
var progress:bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
    pause_mode = Node.PAUSE_MODE_PROCESS
    get_tree().paused = true
    
    
    yield(get_tree().create_timer(2), "timeout")
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
