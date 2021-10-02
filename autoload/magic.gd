extends Node

var tsun:int = 100
var yan:int = 100
var dere:int = 100

var stability: int = 100
var power: int = 0
var shielding: int = 100

var reactor_tick_size: float = 0.1
var reactor_tick_counter: float = 0.0

var depth: int = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

func _physics_process(delta):
    reactor_tick_counter += delta
    if reactor_tick_counter > reactor_tick_size:
        reactor_tick_counter = 0.0
        update_power()
        update_stability()
    #update_labels()

func update_power():
    power = depth

func update_stability():
    var excess = power - shielding
    var stab_d = 0
    if excess > 0:
        stab_d = -excess
    else:
        stab_d = 1
    stability += stab_d
    if stability > 100:
        stability = 100
    elif stability < 0:
        print("boom!")
        stability = 0

func set_depth(value):
    depth = value

