extends Area2D

export var snappable: bool = true
export var slot_number: int = 0

var occupied: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

func get_snap_target():
    return self

func get_snap_location():
    return self.get_global_position()

func update_magic(witch_id: int):
    magic.update_slot(slot_number, witch_id)

func occupy():
    occupied = true
    
func unoccupy():
    occupied = false
