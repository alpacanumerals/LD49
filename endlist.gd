extends VBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    listout()
    pass # Replace with function body.

func listout():
    for i in range(13):
        var list_button_load = load("res://witch.tscn")
        var list_button = list_button_load.instance()
        self.add_child(list_button)
        list_button.initialise(i)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass
