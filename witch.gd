extends MarginContainer

var dragging = false
var home: Node
var home_location: Vector2
var snap_target: Node

signal pick_up
signal put_down

var witch_id: int

func _ready():
    connect("pick_up", self, "_pick_up")
    connect("put_down", self, "_put_down")

func initialise(witch_index):
    witch_id = witch_index
    var fetched_witch = witches.witch_array[witch_index]
    var face = load("res://assets_faces/"+fetched_witch[2]+".png")
    $Button.icon = face
    $Button.text = fetched_witch[0]

func _process(delta):
    if dragging:
        var mousepos = get_viewport().get_mouse_position()
        set_global_position(mousepos)

func _pick_up():
    home = get_parent()
    snap_target = get_parent()
    home_location = get_global_position()
    dragging = true

func _put_down():
    dragging = false
    if snap_target != home:
        get_parent().remove_child(self)
        if home.has_method("update_magic"):
            home.update_magic(self)
        snap_target.add_child(self)
        if snap_target.has_method("update_magic"):
            snap_target.update_magic(self)
        if snap_target.has_method("get_snap_location"):
            var snap_loc = snap_target.get_snap_location()
            self.set_global_position(snap_loc)
    else:
        self.set_global_position(home_location)

func _on_Button_button_down():
    emit_signal("pick_up")

func _on_Button_button_up():
    emit_signal("put_down")

func _on_WitchZone_area_entered(area):
    if dragging && "snappable" in area:
        snap_target = area.get_snap_target()
    
func _on_WitchZone_area_exited(area):
    if dragging && "snappable" in area:
        snap_target = home
