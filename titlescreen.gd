extends MarginContainer

func _ready():
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass

func _on_NewGameButton_button_down():
    switcher.playClick()
    
func _on_NewGameButton_pressed():
    witches.init_witches()
    switcher.switchScene("res://reactor.tscn")

func _on_CheckButton_toggled(button_pressed):
    switcher.playClick()
    if button_pressed:
        settings.tutorial = true
    else:
        settings.tutorial = false
    pass # Replace with function body.
