extends Sprite2D

@onready var beer_glass : AnimatedSprite2D = $BeerGlass
@onready var cider_glass : AnimatedSprite2D = $CiderGlass
enum glass_state {NULL, EMPTY, FULL}
var beer_glass_state : glass_state = glass_state.NULL
var cider_glass_state : glass_state = glass_state.NULL

var can_click_place_beer : bool = false
var can_click_place_cider : bool = false
var can_click_pour_beer : bool = false
var can_click_pour_cider : bool = false

func _ready() -> void:
	update_glass(beer_glass, beer_glass_state)
	update_glass(cider_glass, cider_glass_state)

func update_glass(glass : AnimatedSprite2D, state : glass_state) -> void:
	if state == glass_state.NULL:
		glass.visible = false
	else:
		glass.visible = true
		if state == glass_state.EMPTY:
			glass.play("Empty")
		else:
			glass.play("Full")

func place_beer(state : String) -> void:
	if can_place_beer():
		if state == "Full":
			beer_glass_state = glass_state.FULL
		else:
			beer_glass_state = glass_state.EMPTY
		update_glass(beer_glass, beer_glass_state)

func place_cider(state : String) -> void:
	if can_place_cider():
		if state == "Full":
			cider_glass_state = glass_state.FULL
		else:
			cider_glass_state = glass_state.EMPTY
		update_glass(cider_glass, cider_glass_state)

func pick_up_beer() -> String:
	var temp_state : String = ""
	if !can_place_beer():
		if beer_glass_state == glass_state.EMPTY:
			temp_state = "Empty"
		elif beer_glass_state == glass_state.FULL:
			temp_state = "Full"
		beer_glass_state = glass_state.NULL
	update_glass(beer_glass, beer_glass_state)
	return temp_state

func pick_up_cider() -> String:
	var temp_state : String = ""
	if !can_place_cider():
		if cider_glass_state == glass_state.EMPTY:
			temp_state = "Empty"
		elif cider_glass_state == glass_state.FULL:
			temp_state = "Full"
		cider_glass_state = glass_state.NULL
	update_glass(cider_glass, cider_glass_state)
	return temp_state

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
