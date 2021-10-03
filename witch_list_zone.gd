extends Area2D

export var snappable: bool = true
var occupied: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

func get_snap_target():
    return get_parent().get_snap_target()
