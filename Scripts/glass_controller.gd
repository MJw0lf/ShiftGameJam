extends Sprite2D

var is_empty : bool = true

func set_in_hand() -> void:
	var viewport_size = get_viewport_rect().size
	
	position = Vector2(viewport_size.x/2, (viewport_size.y/5) * 4)
	scale = Vector2(10, 10)
