extends Control

var progress:bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
    yield(get_tree().create_timer(2), "timeout")
    progress = true
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass

func _input(event):
    if event is InputEventMouseButton and progress == true:
        if event.button_index == BUTTON_LEFT and event.pressed:
            switcher.playClick()
            queue_free()
