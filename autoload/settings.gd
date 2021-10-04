extends Node

var volumeMusic: float
var volumeSound: float
var Orchestrion
var Explosion
var tutorial:bool = true

func tutoring():
    var tutor_load = load("res://dialoguebox.tscn") 
    var tutor = tutor_load.instance()
    get_viewport().add_child(tutor)

func _ready():
    pause_mode = Node.PAUSE_MODE_PROCESS
    Orchestrion = AudioStreamPlayer.new()
    var music = load("res://assets/amusic.mp3")
    yield(get_tree().create_timer(0.5), "timeout")
    add_child(Orchestrion)
    Orchestrion.set_stream(music)
    Orchestrion.volume_db = 0
    Orchestrion.pitch_scale = 1
    Orchestrion.play()
    
    Explosion = AudioStreamPlayer.new()
    var explosion = load("res://assets/explosion.wav")
    add_child(Explosion)
    Explosion.set_stream(explosion)
    Explosion.volume_db = 10
    Explosion.pitch_scale = 1
    
