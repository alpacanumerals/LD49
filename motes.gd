extends CPUParticles2D

signal prepared(node)

signal flare_warning

# Called when the node enters the scene tree for the first time.
func _ready():
    connect("prepared", magic, "_on_motes_prepared")
    emit_signal("prepared", self)

func incoming_flare():
    emit_signal("flare_warning")
    amount = 200
    restart()

func activate_flare():
    amount = 500
    restart()

func end_flare():
    amount = 100
    restart()
