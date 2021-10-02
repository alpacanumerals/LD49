extends Area2D

var dragging = false
var homeLocation: Vector2
var snapLocation: Vector2

signal pick_up
signal put_down

func _ready():
    connect("pick_up", self, "_pick_up")
    connect("put_down", self, "_put_down")
    var face = load("res://assets_faces/manako.png")
    $Button.icon = face

func _process(delta):
    if dragging:
        var mousepos = get_viewport().get_mouse_position()
        self.set_global_position(mousepos)

func _pick_up():
    homeLocation = self.get_global_position()
    snapLocation = homeLocation
    print(homeLocation.x)
    dragging = true

func _put_down():
    dragging = false
    self.set_global_position(snapLocation)

func _on_Button_button_down():
    emit_signal("pick_up")

func _on_Button_button_up():
    emit_signal("put_down")

func _on_Witch_area_entered(area):
    snapLocation = area.get_global_position()
    
func _on_Witch_area_exited(area):
    snapLocation = homeLocation
