extends Label

# Called when the node enters the scene tree for the first time.
func _ready():
    if magic.bad_end:
        text = "The ritual ended in disaster, with the accidental summoning of a Deep Witch. Will the coven ever be seen again?"
