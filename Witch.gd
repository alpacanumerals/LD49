extends Node2D

var dragging = false

signal dragsignal;

func _ready():
	connect("dragsignal", self, "_set_drag_pc")

func _process(delta):
	if dragging:
		var mousepos = get_viewport().get_mouse_position()
		self.global_position = Vector2(mousepos.x, mousepos.y)

func _set_drag_pc():
	dragging=!dragging

func _on_Button_button_down():
    emit_signal("dragsignal")

func _on_Button_button_up():
    emit_signal("dragsignal")
