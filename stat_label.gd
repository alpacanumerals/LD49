extends Label

export(String) var stat_name
export(String) var stat_label

var reactor

# Called when the node enters the scene tree for the first time.
func _ready():
    reactor = get_tree().get_root().get_node("ColorRect")
    pass # Replace with function body.

func _process(_delta):
    var value = magic[stat_name]
    self.text = stat_label + ": " + str(int(value))
