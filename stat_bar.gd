extends ProgressBar

export(String) var stat_name

# Called when the node enters the scene tree for the first time.
func _ready():
    if self.stat_name == "energy":
        self.max_value = witches.min_energy

func _process(_delta):
    self.value = magic[stat_name]

func _on_SummonButton_add_witch():
    if self.stat_name == "energy":
        self.max_value = witches.min_energy
