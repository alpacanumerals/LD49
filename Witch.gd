extends KinematicBody2D

var dragging = false
var startLocation: Vector2

signal pick_up
signal put_down

func _ready():
    connect("pick_up", self, "_pick_up")
    connect("put_down", self, "_put_down")

func _process(delta):
    if dragging:
        var mousepos = get_viewport().get_mouse_position()
        self.set_global_position(Vector2(mousepos.x, mousepos.y))

func _pick_up():
    print("foo")
    startLocation = self.get_global_position()
    dragging = true

func _put_down():
    print("bar")
    dragging = false
    var drop_candidates = $Collider.get_overlapping_bodies()
    for candidate in drop_candidates:
        if candidate.has_method("get_snap_location"):
            var loc = candidate.get_snap_location()
            self.set_global_position(loc)
            return
    self.set_global_position(startLocation)

func _on_Button_button_down():
    print("baz")
    emit_signal("pick_up")

func _on_Button_button_up():
    print("bonk")
    emit_signal("put_down")
