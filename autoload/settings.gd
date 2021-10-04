extends Node

var volumeMusic: float
var volumeSound: float

func _ready():
    pause_mode = Node.PAUSE_MODE_PROCESS
    var Orchestrion = AudioStreamPlayer.new()
    var music = load("res://assets/amusic.mp3")
    yield(get_tree().create_timer(0.5), "timeout")
    add_child(Orchestrion)
    Orchestrion.set_stream(music)
    Orchestrion.volume_db = 1
    Orchestrion.pitch_scale = 1
    Orchestrion.play()
