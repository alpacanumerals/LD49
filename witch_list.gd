extends VBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

func _on_SummonButton_add_witch():
    var list_button_load = load("res://witch.tscn")
    var list_button = list_button_load.instance()
    add_child(list_button)
    list_button.initialise(witches.witch_array.size()-1)

func get_snap_size():
    return Vector2(get_parent().rect_size.x, 50)

func get_snap_target():
    return self

func occupy():
    pass
    
func unoccupy():
    pass
