extends Camera2D

const positions : Array[Vector2] = [Vector2(-576, 324), Vector2(576, 324), Vector2(1728, 324)]
var scene_manager : Node2D
@onready var ui : Control = $UI

func _ready() -> void:
	scene_manager = get_parent()
	
	go_to_pos(1)

func go_to_pos(pos_index : int) -> void:
	position = positions[pos_index]
	
	if scene_manager:
		scene_manager.camera_moved(position)

func open_drink_ui() -> void:
	ui.open_drink_ui()

func is_ui_open() -> bool:
	return ui.is_ui_up()
