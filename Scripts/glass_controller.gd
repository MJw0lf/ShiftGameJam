extends Sprite2D

var is_empty : bool = true
var current_drink : String = "Empty"
var ingredients : Array = []

var in_hand_pos_x : float = 0

func _ready() -> void:
	set_in_hand(in_hand_pos_x)

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		print_debug(current_drink)

func set_in_hand(new_pos : float) -> void:
	in_hand_pos_x = new_pos
	
	var viewport_size = get_viewport_rect().size
	
	position = Vector2(in_hand_pos_x, (viewport_size.y/5) * 4)
	scale = Vector2(10, 10)

func set_empty(state : bool) -> void:
	is_empty = state
	update_state()

func add_ingredient(ingredient : String) -> void:
	ingredients.push_back(ingredient)
	is_empty = false
	current_drink = DrinkList.find_drink(ingredients)
	update_state()

func update_state() -> void:
	if is_empty:
		texture = load("res://Textures/Placeholder/GlassEmpty.png")
	else:
		texture = load("res://Textures/Placeholder/GlassFull.png")

func has_ingredient(test_ingredient : String) -> bool:
	for ingredient in ingredients:
		if test_ingredient == ingredient:
			return true
	
	return false
