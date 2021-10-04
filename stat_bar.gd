extends ProgressBar

export(String) var stat_name

# Called when the node enters the scene tree for the first time.
func _ready():
    self.max_value = witches.min_energy

func _process(_delta):
    self.value = magic[stat_name]

func _on_SummonButton_add_witch():
    self.max_value = witches.min_energy
