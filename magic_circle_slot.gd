extends Area2D

export var snappable: bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

func get_snap_target():
    return self

func get_snap_location():
    return self.get_global_position()
