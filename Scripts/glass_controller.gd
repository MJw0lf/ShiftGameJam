extends Sprite2D

var is_empty : bool = true

func _ready() -> void:
	set_in_hand()

func set_in_hand() -> void:
	var viewport_size = get_viewport_rect().size
	
	position = Vector2(viewport_size.x/2, (viewport_size.y/5) * 4)
	scale = Vector2(10, 10)

func set_empty(state : bool) -> void:
	is_empty = state
	update_state()

func update_state() -> void:
	pass
