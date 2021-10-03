extends Button

signal add_witch
signal doing_summon

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
    emit_signal("doing_summon")
    witches.witch_summon(magic.energy)
    magic.energy = 0.0
    emit_signal("add_witch")
    witches.witch_display_summon()

func _on_SummonButton_button_down():
    switcher.playClick()

func _on_SummonButton_pressed():
    disabled = true
    do_summon()
