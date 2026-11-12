extends Node2D

var in_hand : Sprite2D
var glass_instance : PackedScene = preload("res://Objects/glass.tscn")

var glass_rack : Sprite2D
var taps : Sprite2D

var people : Array[Sprite2D] = []
const people_pos : Array[Vector2] = [Vector2(192, 325), Vector2(576, 325), Vector2(960, 325)]
@onready var person_instance : PackedScene = preload("res://Objects/person.tscn")

var clicked : bool = false

var camera_pos : Vector2 = Vector2.ZERO

func _ready() -> void:
	glass_rack = find_child("GlassRack")
	taps = find_child("Taps")
	
	add_people()

func _physics_process(delta: float) -> void:
	clicked = false
	if Input.is_action_just_pressed("click"):
		if glass_rack:
			clicked = true
			if glass_rack.can_be_clicked:
				clicked_glass_rack()
			else:
				clicked = false
		if taps and !clicked:
			clicked = true
			if taps.can_click_place_beer:
				clicked_taps_beer()
			elif taps.can_click_place_cider:
				clicked_taps_cider()
			elif taps.can_click_pour_beer:
				taps.fill_beer()
			elif taps.can_click_pour_cider:
				taps.fill_cider()
			else:
				clicked = false
		if !clicked:
			for person in people:
				if person:
					if person.can_be_clicked:
						clicked_person(person)

func clicked_glass_rack() -> void:
	if hand_is_full():
		if !glass_rack.is_full() and in_hand.is_empty:
			glass_rack.return_glass()
			empty_hand()
	else:
		if glass_rack.can_take_glass():
			glass_rack.take_glass()
			pick_up_glass()

func clicked_taps_beer() -> void:
	if hand_is_full():
		if taps.can_place_beer() and in_hand.is_in_group("Drink"):
			taps.place_beer(in_hand)
			in_hand = null
	else:
		if !taps.can_place_beer():
			in_hand = taps.pick_up_beer()
			in_hand.set_in_hand(camera_pos.x)

func clicked_taps_cider() -> void:
	if hand_is_full():
		if taps.can_place_cider() and in_hand.is_in_group("Drink"):
			taps.place_cider(in_hand)
			in_hand = null
	else:
		if !taps.can_place_cider():
			in_hand = taps.pick_up_cider()
			in_hand.set_in_hand(camera_pos.x)

func clicked_person(person : Sprite2D) -> void:
	if hand_is_full():
		if person.is_right_drink(in_hand.current_drink):
			empty_hand()

func pick_up_glass() -> void:
	if !hand_is_full():
		in_hand = glass_instance.instantiate()
		add_child(in_hand)
		in_hand.set_in_hand(camera_pos.x)

func add_people() -> void:
	for pos in people_pos:
		var add_person : Sprite2D = person_instance.instantiate()
		add_child(add_person)
		add_person.position = pos
		people.push_back(add_person)

func camera_moved(new_pos : Vector2) -> void:
	camera_pos = new_pos
	if hand_is_full():
		in_hand.set_in_hand(camera_pos.x)

func add_ingredient(ingredient : String) -> void:
	if hand_is_full():              
		if !in_hand.has_ingredient(ingredient):
			in_hand.add_ingredient(ingredient)

func hand_is_full() -> bool:
	return in_hand != null

func empty_hand() -> void:
	in_hand.queue_free()
