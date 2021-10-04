extends Node2D

var anchor = Vector2(100.0,0.0)
var velocity = Vector2()
var going_down:bool = false
var going_up:bool= false
var wobble = none
enum {none, light}
var wobtime:float

var base_position = Vector2()

var depth

func _draw():
    draw_line(Vector2.ZERO, Vector2(global_position.y,0),Color( 0.18, 0.18, 0.18, 1 ), 1.5)
    #I don't know how this fucking works. But it works well enough.

func _ready():
    depth = global_position.y
    base_position = position

func _process(delta):
    set_position(base_position)
    look_at(anchor) #This points the containment vessel to a point near the top.
    if going_down:
        velocity.y = 16.0
    elif going_up:
        velocity.y = -8.0
    else:
        velocity.y = 0.0  
    position.x = clamp(position.x, 16, 104)
    position.y = clamp(position.y, 30, 684)
    magic.set_depth(global_position.y)
    if wobtime == 6.0:
        velocity.x = 6
    if position.x > 60:
        velocity.x -= 0.1
    else:
        velocity.x += 0.1
    wobtime -= delta
    wobtime = clamp(wobtime,0.0,20.0)
    position += velocity * delta
    if wobtime == 0.0:
        position.x = 60.0
        velocity.x = 0.0
    base_position = position
    update() #This is needed for the cable to draw properly. 
    judder()
    paradox()
    explode()

func judder():
    if magic.criticality > 2:
        var juddersize = magic.criticality-1
        var x_judder = randi()%juddersize
        var y_judder = randi()%juddersize
        var perturbed_position = position + Vector2(x_judder, y_judder)
        self.set_position(perturbed_position)

func paradox():
    $ParadoxNoise.volume_db = magic.criticality
    if magic.criticality > 1:
        if (!$ParadoxNoise.playing):
            $ParadoxNoise.play()
    else:
        $ParadoxNoise.stop()

func explode():
    if magic.criticality > 3:
        if !settings.Explosion.playing:
            settings.Explosion.play()
            $Explosion.restart()
            yield(get_tree().create_timer(2), "timeout")
            switcher.switchScene("res://failurescreen.tscn")

func _on_GoingDown_toggled(button_pressed):
    if button_pressed:
        $CableSounds.play()
        going_down = true
        wobble = light
        wobtime = 6.0
    else:   
        $CableSounds.stop()
        $MetalMoan.play()
        going_down = false
        wobble = light
        wobtime = 6.0

func _on_GoingUp_toggled(button_pressed):
    if button_pressed:
        $CableSounds.play()
        going_up = true
        wobble = light
        wobtime = 6.0
    else:
        $CableSounds.stop()
        $MetalMoan.play()
        going_up = false
        wobble = light
        wobtime = 6.0
