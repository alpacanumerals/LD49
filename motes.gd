extends CPUParticles2D

signal prepared(node)

# Called when the node enters the scene tree for the first time.
func _ready():
    connect("prepared", magic, "_on_motes_prepared")
    emit_signal("prepared", self)

func incoming_flare():
    amount = 200
    restart()
    print("flare incoming!")

func activate_flare():
    amount = 500
    restart()
    print("flare active!")

func end_flare():
    amount = 100
    restart()
    print("flare over...")
