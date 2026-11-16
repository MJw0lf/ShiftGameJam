extends Sprite2D

var can_be_clicked : bool = false

func _on_area_2d_mouse_entered() -> void:
	can_be_clicked = true

func _on_area_2d_mouse_exited() -> void:
	can_be_clicked = false
