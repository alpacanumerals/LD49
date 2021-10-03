extends Node2D

var anchor = Vector2(100.0,0.0)
var speed = 20
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
    var velocity = Vector2()
    if going_down:
        velocity.y += 16
    if going_up:
        velocity.y -= 8     
    position.x = clamp(position.x, 16, 104)
    position.y = clamp(position.y, 29, 684)
    magic.set_depth(global_position.y)
    if wobtime == 6.0:
        velocity.x += 2
    else:
        pass
    wobtime -= delta
    position += velocity * delta    
    if position.x > 60:
        velocity.x -= 0.5
        breakpoint
    else:
        velocity.x += 0.5
    ###TEMPORARY TESTING CODE

    if Input.is_action_pressed("pmove_right"):
        velocity.x += 1
    if Input.is_action_pressed("pmove_left"):
        velocity.x -= 1
    if Input.is_action_pressed("pmove_down"):
        velocity.y += 1
    if Input.is_action_pressed("pmove_up"):
        velocity.y -= 1    
    if velocity.length() > 0:
        velocity = velocity.normalized() * speed
        
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
