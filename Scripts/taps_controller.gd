extends Sprite2D

var beer_glass : Sprite2D
var cider_glass : Sprite2D
enum glass_state {NULL, EMPTY, FULL}
var beer_glass_state : glass_state = glass_state.NULL
var cider_glass_state : glass_state = glass_state.NULL

var can_click_place_beer : bool = false
var can_click_place_cider : bool = false
var can_click_pour_beer : bool = false
var can_click_pour_cider : bool = false

const fill_drink_max_time : float = 3
var filling_beer : bool = false
var fill_beer_timer : float = 0
var filling_cider : bool = false
var fill_cider_timer : float = 0

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	test_fill_beer(delta)
	test_fill_cider(delta)

func test_fill_beer(delta : float) -> void:
	if filling_beer:
		fill_beer_timer += delta
		if fill_beer_timer >= fill_drink_max_time:
			beer_glass_state = glass_state.FULL
			fill_beer_timer = 0
			filling_beer = false
			beer_glass.add_ingredient("Beer")

func test_fill_cider(delta : float) -> void:
	if filling_cider:
		fill_cider_timer += delta
		if fill_cider_timer >= fill_drink_max_time:
			cider_glass_state = glass_state.FULL
			fill_cider_timer = 0
			filling_cider = false
			cider_glass.add_ingredient("Cider")

func place_beer(glass : Sprite2D) -> void:
	if can_place_beer():
		if glass.is_empty:
			beer_glass_state = glass_state.EMPTY
		else:
			beer_glass_state = glass_state.FULL
		beer_glass = glass
		beer_glass.scale = scale
		beer_glass.position = position + Vector2(-14, 8)*scale

func place_cider(glass : Sprite2D) -> void:
	if can_place_cider():
		if glass.is_empty:
			cider_glass_state = glass_state.EMPTY
		else:
			cider_glass_state = glass_state.FULL
		cider_glass = glass
		cider_glass.scale = scale
		cider_glass.position = position + Vector2(14, 8)*scale

func pick_up_beer() -> Sprite2D:
	var temp_glass = null
	if !can_place_beer():
		temp_glass = beer_glass
		beer_glass_state = glass_state.NULL
		beer_glass = null
	return temp_glass

func pick_up_cider() -> Sprite2D:
	var temp_glass = null
	if !can_place_cider():
		temp_glass = cider_glass
		cider_glass_state = glass_state.NULL
		cider_glass = null
	return temp_glass

func fill_beer() -> void:
	if !filling_beer and beer_glass_state == glass_state.EMPTY:
		filling_beer = true

func fill_cider() -> void:
	if !filling_cider and cider_glass_state == glass_state.EMPTY:
		filling_cider = true

func can_place_beer() -> bool:
	return beer_glass_state == glass_state.NULL

func can_place_cider() -> bool:
	return cider_glass_state == glass_state.NULL

func _on_place_beer_mouse_entered() -> void:
	can_click_place_beer = true

func _on_place_beer_mouse_exited() -> void:
	can_click_place_beer = false

func _on_place_cider_mouse_entered() -> void:
	can_click_place_cider = true

func _on_place_cider_mouse_exited() -> void:
	can_click_place_cider = false

func _on_fill_beer_mouse_entered() -> void:
	can_click_pour_beer = true

func _on_fill_beer_mouse_exited() -> void:
	can_click_pour_beer = false

func _on_fill_cider_mouse_entered() -> void:
	can_click_pour_cider = true

func _on_fill_cider_mouse_exited() -> void:
	can_click_pour_cider = false
