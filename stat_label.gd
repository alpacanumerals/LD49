extends Label

export(String) var statname

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

func set_value(value):
    self.text = statname + ": " + str(value)
