extends Label

# Called when the node enters the scene tree for the first time.
func _ready():
    self.text = "Total energy: " + str(magic.total_energy)
