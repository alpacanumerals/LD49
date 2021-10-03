extends Button

signal add_witch

export var summon_timeout: int = 5
var timeout_timer: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

func _process(delta):
    # just saying, this is some hack bullshit imo
    if (magic.check_auto_summon()):
        do_summon()
    if (disabled):
        timeout_timer += delta
        if (timeout_timer > summon_timeout):
            disabled = true
    else:
        timeout_timer = 0.0

func do_summon():
    witches.witch_summon(magic.energy)
    magic.energy = 0.0
    var list_button_load = load("res://witch.tscn")
    var list_button = list_button_load.instance()
    emit_signal("add_witch")
    list_button.initialise(witches.witch_array.size()-1)
    witches.witch_display_summon()

func _on_SummonButton_button_down():
    switcher.playClick()

func _on_SummonButton_pressed():
    disabled = true
    do_summon()
