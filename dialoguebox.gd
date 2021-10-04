extends Control

var progress:bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
    pause_mode = Node.PAUSE_MODE_PROCESS
    get_tree().paused = true
    settings.Orchestrion.volume_db = -16
    
    yield(get_tree().create_timer(2), "timeout")
    progress = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass

func _input(event):
    if event is InputEventMouseButton and progress == true:
        if event.button_index == BUTTON_LEFT and event.pressed:
            settings.Orchestrion.volume_db = 0
            switcher.playClick()
            get_tree().paused = false
            queue_free()
