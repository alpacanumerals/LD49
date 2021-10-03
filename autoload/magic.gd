extends Node

var tsun:float = 100.0
var yan:float = 100.0
var dere:float = 100.0

var stability: float = 100.0
var power: float = 0.0
var shielding: float = 100.0

var energy: int = 0
var total_energy: int = 0

var reactor_tick_size: float = 0.1
var reactor_tick_counter: float = 0.0

var auto_summon_rate: int = 10
var auto_summon_timer: float = 0.0

var depth: int = 0

#atk, def
const null_stats = [0, 0]

# for testing, 0 = centre, 1 = inner, 2 = ring, 3 = outer
var slots = []

func _ready():
    for _i in range(13):
        slots.append(null_stats.duplicate())

func _physics_process(delta):
    reactor_tick_counter += delta
    auto_summon_timer += delta
    if reactor_tick_counter > reactor_tick_size:
        reactor_tick_counter -= reactor_tick_size
        update_flux()
        update_power()
        update_energy()
        update_shielding()
        update_stability()

func update_flux():
    tsun = depth
    if (tsun < 0):
        tsun = 0
    yan = depth*depth*depth/(350*350.0)
    if (yan < 0):
        yan = 0

func update_power():
    var t_atk = slots[3][0] + slots[0][0]
    var y_atk = slots[1][0] + slots[0][0]
    var effective_t = tsun
    if tsun > t_atk:
        effective_t = t_atk
    var effective_y = yan
    if yan > y_atk:
        effective_y = y_atk
    power = effective_t*t_atk/1000.0 + effective_y*y_atk/1000.0

func update_energy():
    energy += int(power)/50
    
func reset_energy():
    total_energy += energy
    energy = 0.0

func update_shielding():
    var def = slots[2][1] + slots[0][1]
    dere = sqrt((tsun + yan)*def/2.0)
    shielding = 100 + dere

func update_stability():
    var excess: float = power - shielding
    var stab_d: float = 0
    if excess > 0:
        stab_d = -sqrt(excess*excess*excess)/1000.0
    else:
        stab_d = 1.0
    stability += stab_d
    if stability > shielding:
        stability = shielding
    elif stability < 0:
        print("boom!")
        stability = 0

func update_slot(slot_number, witch_id):
    var stats: Array
    if (witch_id < 0):
        stats = null_stats.duplicate()
    else:
        var witch = witches.witch_array[witch_id]
        stats = [witch[3], witch[4]]
    slots[slot_number] = stats
    
func set_depth(value):
    depth = value

func check_auto_summon():
    if (auto_summon_timer > auto_summon_rate):
        auto_summon_timer = 0.0
        return true
    else:
        return false
