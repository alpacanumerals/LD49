extends VBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass


func _on_GoingDown_toggled(button_pressed):
    if button_pressed:
        $GoingUp.set_disabled(true)
    else:
        $GoingUp.set_disabled(false)

func _on_GoingUp_toggled(button_pressed):
    if button_pressed:
        $GoingDown.set_disabled(true)
    else:
        $GoingDown.set_disabled(false)
