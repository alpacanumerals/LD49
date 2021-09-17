extends Node

var current_scene
var ui_click = preload("res://autoload/uiclick.tscn")
var uiClick

func _ready():
    #An autoloaded node is the elder sibling of whatever scene is active, so they share a root.
    var root = get_tree().get_root()
    #A count of the children is always 1 more than the 0-indexed id of the active scene.
    #(The one with everythnig in it)
    current_scene = root.get_child(root.get_child_count() - 1)
    uiClick = ui_click.instance()
    add_child(uiClick)

#Activates with a button press somewhere.
func switchScene(path):
    yield(get_tree().create_timer(0.15), "timeout")
    get_tree().change_scene(path)
    
func switchQuit():
    yield(get_tree().create_timer(0.2), "timeout")
    get_tree().quit()
    
func playClick():
    uiClick.play()
    pass
