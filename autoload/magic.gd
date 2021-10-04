extends Node

var gamestart

var tsun:float = 0.0
var yan:float = 0.0
var dere:float = 0.0
var dere_buildup:float = 0.0
var dere_decay:float = 0.0

var stability: float = 100.0
var power: float = 0.0
var shielding: float = 0.0

var flare:bool = false
var flare_value: float = 0.0

var energy: float = 0.0
var total_energy: float = 0.0

var criticality: int = 0

var reactor_tick_size: float = 0.1
var reactor_tick_counter: float = 0.0

var auto_summon_rate: int = 30
var auto_summon_timer: float = 0.0
var summon_acceleration: float = 1.0
var bad_end: bool = false

const summon_threshold = 250

var depth: float = 0

#atk, def
const null_stats = [0, 0]

# 0 = centre
# 1-4 = ring (dere)
# 5-8 = outer (tsun)
# 9-12 = inner (yan)
var slots = []

func _ready():
    for _i in range(13):
        slots.append(null_stats.duplicate())

func _physics_process(delta):
    if gamestart:
        reactor_tick_counter += delta
        if reactor_tick_counter > reactor_tick_size:
            reactor_tick_counter -= reactor_tick_size
            update_dere_decay()
            update_tflux()
            update_yflux()
            update_dflux()
            update_power()
            update_energy()
            update_shielding()
            summon_timer()
        if energy > summon_threshold:
            auto_summon_timer += delta*summon_acceleration

func update_dere_decay():
    dere_buildup += dere
    dere_decay = dere_buildup*0.01
    dere_buildup -= dere_decay
    
func update_tflux():
    var mod #t-particle moderation
    var osc #natural oscillation of t-particle flux
    var fluct = 1.0
    var poison = dere_buildup/100
    if depth < 108.0: 
        mod = 0.1 #above the rim, t-particles are heavily moderated.
        osc = 0.01
    elif depth >= 108.0 and depth <= 130.0: 
        mod = 0.1+1.3*((depth-108.0)/22) #Just inside, t-flux rapidly increases, ending in a small spike.
        osc = 0.02
    elif depth > 670.0: 
        mod = sqrt(depth-669.0) #Below 670m, flux becomes rapidly lethal.
        osc = 0.07
    else: 
        mod = 1.0
        osc = (sqrt(depth/670))/16
    fluct = 1.0+util.randgen.randf_range(-osc,osc)
    fluct = 1.0 #TESTING VALUE
    tsun = clamp((fluct*depth*mod*(1.0+flare_value))+dere_decay-poison,0,20000.0)
    
func update_yflux():
    var mod #y-ray moderation
    var osc #natural oscillation of y-ray flux
    var fluct = 1.0
    var poison = dere_buildup/100
    if depth < 108.0: 
        mod = 0.5 #Above the rim, y-particles are somewhat moderated.
        osc = 0.0
    elif depth >= 108.0 and depth <= 130.0: 
        mod = 0.5+0.5*((depth-108.0)/22) #Just inside, y-flux increases.
        osc = 0.02
    elif depth > 670.0: 
        mod = sqrt(depth-669.0) #Below 670m, flux becomes rapidly lethal.
        osc = 0.02
    else:
        mod = 1.0
        osc = 0.02
    if not osc == 0.0:
        fluct = 1.0+util.randgen.randf_range(-osc,osc)
    fluct = 1.0 #TESTING VALUE
    yan = clamp((fluct*depth*depth*depth*mod*(1.0+flare_value)/(350*350))-poison,0,20000.0)

func update_dflux():
    var d_factor = sqrt(slots[1][0]+slots[2][0]+slots[3][0]+slots[4][0])/200
    var osc = 0.02
    var fluct = 1.0
#    fluct = 1.0+util.randgen.randf_range(-osc,osc)
    dere = d_factor*(tsun+yan)*fluct

func update_power():
    var d_atk = sqrt(slots[1][0]+slots[2][0]+slots[3][0]+slots[4][0])/100
    var t_atk = sqrt(slots[5][0]+slots[6][0]+slots[7][0]+slots[8][0])/100
    var y_atk = sqrt(slots[9][0]+slots[10][0]+slots[11][0]+slots[12][0])/100
    power = d_atk*dere+t_atk*tsun+y_atk*yan

func update_energy():
    energy += power
    
func update_shielding():
    var def = 0.0
    for i in range(5):
        def += slots[i][1]
    shielding = 200 + def/4
        
func summon_timer():
    var radiation = tsun+yan+dere
    var reactor_heat = radiation - shielding
    if radiation < shielding * 0.2:
        criticality = 0
        summon_acceleration = 0
    if radiation < shielding * 0.5:
        criticality = 1
        summon_acceleration = 0.95
    elif radiation < shielding * 0.8:
        criticality = 2
        summon_acceleration = 1.1
    elif radiation < shielding:
        criticality = 3
        summon_acceleration = 1.3
    else:
        criticality = 4

func reset_energy():
    total_energy += energy
    energy = 0.0

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
