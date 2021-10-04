extends ProgressBar

export(String) var stat_name

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

func _process(_delta):
    self.value = magic[stat_name]
