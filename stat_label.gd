extends Label

export(String) var stat_name
export(String) var stat_label

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

func _process(_delta):
    var value = magic[stat_name]
    self.text = stat_label + ": " + str(int(value))
