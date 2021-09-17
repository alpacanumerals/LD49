extends Panel

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

func _on_MainMenuButton_button_down():
    switcher.playClick()
    
func _on_MainMenuButton_pressed():
    switcher.switchScene("res://titlescreen.tscn")
