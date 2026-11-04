extends Sprite2D

@onready var glasses : Array[Sprite2D] = [$GlassEmpty1, $GlassEmpty2, $GlassEmpty3]

var num_of_glasses : int = 3
var can_be_clicked : bool = false

func _ready() -> void:
	_update_glasses()

func _update_glasses() -> void:
	for glass in glasses.size():
		if num_of_glasses > glass:
			glasses[glass].visible = true
		else:
			glasses[glass].visible = false

func can_take_glass() -> bool:
	return num_of_glasses > 0

func is_full() -> bool:
	return num_of_glasses >= 3

func take_glass() -> void:
	if can_take_glass():
		num_of_glasses -= 1
		_update_glasses()

func return_glass() -> void:
	if !is_full():
		num_of_glasses += 1
		_update_glasses()

func _on_mouse_entered() -> void:
	can_be_clicked = true

func _on_mouse_exited() -> void:
	can_be_clicked = false
