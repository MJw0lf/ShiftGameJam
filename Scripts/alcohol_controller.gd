extends Sprite2D
class_name Alcohol

@export var alcohol_name : String = "Beer"
var can_click : bool = false
var normal_pos : Vector2
const up_by : float = 10

var scene_manager : Node2D

func _ready() -> void:
	normal_pos = position
	
	scene_manager = get_parent()

func _physics_process(delta: float) -> void:
	if can_click and Input.is_action_just_pressed("click"):
		if scene_manager:
			scene_manager.add_ingredient(alcohol_name)
		print_debug(alcohol_name + " just clicked")

func _on_mouse_entered() -> void:
	can_click = true
	position.y -= up_by

func _on_mouse_exited() -> void:
	can_click = false
	position = normal_pos
