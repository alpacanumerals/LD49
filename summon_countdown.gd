extends Label

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

func _process(_delta):
    var remaining_time = magic.auto_summon_rate - magic.auto_summon_timer
    self.text = "Summon in: " + str(int(remaining_time))
