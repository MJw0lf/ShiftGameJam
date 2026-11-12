extends Sprite2D
class_name Alcohol

@export var alcohol_name : String = "Beer"
var can_click : bool = false
var normal_pos : Vector2
const up_by : float = 10

var scene_manager : Node2D

@onready var name_label : Label = $Label

func _ready() -> void:
	normal_pos = position
	
	scene_manager = get_parent()
	name_label.visible = false
	name_label.scale = Vector2.ONE/scale
	name_label.global_position = global_position+Vector2(0, -50)

func _physics_process(delta: float) -> void:
	if can_click and Input.is_action_just_pressed("click"):
		if scene_manager:
			scene_manager.add_ingredient(alcohol_name)
		print_debug(alcohol_name + " just clicked")

func _on_mouse_entered() -> void:
	can_click = true
	position.y -= up_by
	
	name_label.visible = true
	name_label.text = alcohol_name

func _on_mouse_exited() -> void:
	can_click = false
	position = normal_pos
	
	name_label.visible = false
