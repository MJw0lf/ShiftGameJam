extends Control

var camera : Camera2D

const max_amt_of_pos : int = 2
var current_pos : int = 0

@onready var right_button : TextureButton = $GoRight
@onready var left_button : TextureButton = $GoLeft

func _ready() -> void:
	camera = get_parent()
	update_buttons()

func _on_go_right_pressed() -> void:
	if camera:
		if current_pos + 1 < max_amt_of_pos:
			current_pos += 1
			camera.go_to_pos(current_pos)
			update_buttons()

func _on_go_left_pressed() -> void:
	if camera:
		if current_pos > 0:
			current_pos -= 1
			camera.go_to_pos(current_pos)
			update_buttons()

func update_buttons() -> void:
	if current_pos + 1 >= max_amt_of_pos:
		right_button.visible = false
	else:
		right_button.visible = true
	if current_pos <= 0:
		left_button.visible = false
	else:
		left_button.visible = true
