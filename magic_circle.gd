extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

func get_snap_location():
    print("honk")
    return Vector2(500,200)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
