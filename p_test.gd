extends KinematicBody2D

var screen_size
var speed = 600

#self-contained click-click mouse move.
var mouse_move: bool = false

func _input_event(NULL1, event, NULL2):
    if event is InputEventMouseButton:
        if event.button_index == BUTTON_LEFT and event.pressed and mouse_move:
            switcher.playClick()
            mouse_move = false
        elif event.button_index == BUTTON_LEFT and event.pressed and not mouse_move:
            switcher.playClick()
            mouse_move = true   

func _ready():
    screen_size = get_viewport_rect().size
    position.x = screen_size.x/2
    position.y = screen_size.y/2
    rotation_degrees = -90
    

func _process(delta):
    match settings.moveScheme:
        settings.HOTLINE:
            look_at(get_global_mouse_position())
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
            position.x = clamp(position.x, 0, screen_size.x)
            position.y = clamp(position.y, 0, screen_size.y)
        settings.INFANTRY:
            look_at(get_global_mouse_position())
            var velocity = Vector2()
            var velocity_r = Vector2()
            var velocity_l = Vector2()
            var velocity_d = Vector2()
            var velocity_u = Vector2()
            if Input.is_action_pressed("pmove_right"):
                velocity_r = Vector2(0, speed).rotated(rotation)
            if Input.is_action_pressed("pmove_left"):
                velocity_l = Vector2(0, -speed).rotated(rotation)
            if Input.is_action_pressed("pmove_down"):
                velocity_d = Vector2(-speed, 0).rotated(rotation)
            if Input.is_action_pressed("pmove_up"):
                velocity_u = Vector2(speed, 0).rotated(rotation)
            velocity = velocity_r + velocity_l + velocity_d + velocity_u
            if velocity.length() != 0 and velocity.length() > 200:
                velocity = velocity.normalized() * speed
            else:
                velocity = Vector2(0,0)
            position += velocity * delta
            position.x = clamp(position.x, 0, screen_size.x)
            position.y = clamp(position.y, 0, screen_size.y)
        settings.MOUSE:
            if mouse_move:
                global_transform.origin = get_global_mouse_position()
        _:
            pass
