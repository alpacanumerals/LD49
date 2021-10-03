extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
    pause_mode = Node.PAUSE_MODE_PROCESS
    var Orchestrion = AudioStreamPlayer.new()
    add_child(Orchestrion)
    var music = load("res://assets/amusic.mp3")
    Orchestrion.set_stream(music)
    Orchestrion.volume_db = 1
    Orchestrion.pitch_scale = 1
    Orchestrion.play()
