extends Sprite2D
class_name Alcohol

@export var alcohol_name : String = "Beer"
var can_click : bool = false
var normal_pos : Vector2
const up_by : float = 10

func _ready() -> void:
	normal_pos = position

func _physics_process(delta: float) -> void:
	if can_click and Input.is_action_just_pressed("click"):
		print_debug(alcohol_name + " just clicked")

func _on_mouse_entered() -> void:
	can_click = true
	position.y -= up_by

func _on_mouse_exited() -> void:
	can_click = false
	position = normal_pos
