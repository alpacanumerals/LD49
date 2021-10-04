extends Node2D

var anchor = Vector2(666.0,220.0)
var velocity = Vector2()
var wobble:bool = false

func _draw():
    draw_line(Vector2.ZERO, Vector2(global_position.y-220,0),Color( 0.0, 0.0, 0.0, 1 ), 1.5)
    #I don't know how this fucking works. But it works well enough.

func _ready():
    pass

func _process(delta):
    look_at(anchor) #This points the containment vessel to a point near the top.
    if not wobble:
        velocity.x = 10
        wobble = true
    if global_position.x > 666:
        velocity.x -= 0.1
    else:
        velocity.x += 0.1
    global_position += velocity * delta 
#    print(str(global_position))   
    update() #This is needed for the cable to draw properly.  
