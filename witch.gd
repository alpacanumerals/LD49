extends MarginContainer

var dragging = false
var home: Node
var home_location: Vector2
var snap_target: Node

signal pick_up
signal put_down

var witch_id: int

var leftclick_check:bool = false

func _ready():
    connect("pick_up", self, "_pick_up")
    connect("put_down", self, "_put_down")

func initialise(witch_index):
    var summoner = get_parent().get_parent().get_parent().get_node("SummonButton")
    summoner.connect("doing_summon", self, "_on_summon_interrupt")
    
    witch_id = witch_index
    var fetched_witch = witches.witch_array[witch_index]
    var face
    if witch_index < 3:
        face = load("res://assets_faces/"+fetched_witch[2]+".png")
    else:
        face = load(witches.witch_array[witch_index][2])
    $Button.icon = face
    $Button.text = fetched_witch[0]

func _process(_delta):
    if dragging:
        var mousepos = get_viewport().get_mouse_position()
        set_global_position(mousepos)

func _pick_up():
    home = get_parent()
    snap_target = get_parent()
    home_location = get_global_position()
    dragging = true
    self.rect_size = Vector2(60,60)
    
func _put_down():
    if dragging:
        dragging = false
        if snap_target != home:
            get_parent().remove_child(self)
            if home.has_method("update_magic"):
                home.update_magic(-1)
            snap_target.add_child(self)
            home.unoccupy()
            snap_target.occupy()
            if snap_target.has_method("update_magic"):
                snap_target.update_magic(witch_id)
            if snap_target.has_method("get_snap_location"):
                var snap_loc = snap_target.get_snap_location()
                self.set_global_position(snap_loc)
        else:
            self.set_global_position(home_location)
        
func _on_Button_gui_input(event):
    if event is InputEventMouseButton and event.pressed:
        match event.button_index:
            BUTTON_LEFT:
                leftclick_check = true
                emit_signal("pick_up")
            BUTTON_RIGHT:
                switcher.playClick()
                
func _on_Button_button_down():
    pass #Passed as it's using the _on_Button_gui_input above.

func _on_Button_button_up():
    if leftclick_check:
        emit_signal("put_down")
        leftclick_check = false
    else:
        witches.witch_index = witch_id
        witches.witch_carding()

func _on_WitchZone_area_entered(area):
    if dragging && "snappable" in area:
        if !area.occupied:
            snap_target = area.get_snap_target()

func _on_WitchZone_area_exited(area):
    if dragging && "snappable" in area:
        snap_target = home

func _on_summon_interrupt():
    if dragging:
        emit_signal("put_down")
