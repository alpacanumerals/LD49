extends Node

var volumeMusic: float
var volumeSound: float

var moveScheme = MOUSE
enum {NONE, HOTLINE, INFANTRY, MOUSE}

func _ready():
    pause_mode = Node.PAUSE_MODE_PROCESS
    pass
