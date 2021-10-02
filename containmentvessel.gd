extends Node2D

var anchor = Vector2(100.0,0.0)
var speed = 20

var depth

func _draw():
    draw_line(Vector2.ZERO, Vector2(global_position.y,0),Color( 0.18, 0.18, 0.18, 1 ), 1.5)
    #I don't know how this fucking works. But it works well enough.

func _ready():
    depth = global_position.y

func _process(delta):
    look_at(anchor) #This points the containment vessel to a point near the top.
    
    ###TEMPORARY TESTING CODE
    var velocity = Vector2()
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
    position += velocity * delta
    ###TEMPORARY TESTING CODE
        
    magic.set_depth(global_position.y)
    
    update() #This is needed for the cable to draw properly.
    pass
