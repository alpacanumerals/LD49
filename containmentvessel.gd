extends Node2D

var anchor = Vector2(100.0,0.0)
var velocity = Vector2()
var going_down:bool = false
var going_up:bool= false
var wobble = none
enum {none, light}
var wobtime:float


var depth

func _draw():
    draw_line(Vector2.ZERO, Vector2(global_position.y,0),Color( 0.18, 0.18, 0.18, 1 ), 1.5)
    #I don't know how this fucking works. But it works well enough.

func _ready():
    depth = global_position.y

func _process(delta):
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
    update() #This is needed for the cable to draw properly.  

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
