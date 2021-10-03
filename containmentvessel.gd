extends Node2D

var anchor = Vector2(100.0,0.0)
var speed = 20
var going_down:bool = false
var going_up:bool= false

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
        velocity.y += 15
    if going_up:
        velocity.y -= 8     
    update() #This is needed for the cable to draw properly.  
    position += velocity * delta
    position.x = clamp(position.x, 16, 104)
    position.y = clamp(position.y, 29, 684)
    magic.set_depth(global_position.y)
                
    ###TEMPORARY TESTING CODE

#    if Input.is_action_pressed("pmove_right"):
#        velocity.x += 1
#    if Input.is_action_pressed("pmove_left"):
#        velocity.x -= 1
#    if Input.is_action_pressed("pmove_down"):
#        velocity.y += 1
#    if Input.is_action_pressed("pmove_up"):
#        velocity.y -= 1    
#    if velocity.length() > 0:
#        velocity = velocity.normalized() * speed
#    

func _on_GoingDown_toggled(button_pressed):
    if button_pressed:
        $CableSounds.play()
        going_down = true
        print(String(going_down))
        print(String(going_up))
    else:   
        $CableSounds.stop()
        $MetalMoan.play()
        going_down = false

func _on_GoingUp_toggled(button_pressed):
    if button_pressed:
        $CableSounds.play()
        going_up = true
    else:
        $CableSounds.stop()
        $MetalMoan.play()
        going_up = false
