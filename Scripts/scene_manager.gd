extends Node2D

var in_hand : Sprite2D
var glass_instance : PackedScene = preload("res://Objects/glass.tscn")

var glass_rack : Sprite2D
var taps : Sprite2D

func _ready() -> void:
	glass_rack = find_child("GlassRack")
	taps = find_child("Taps")

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("click"):
		if glass_rack:
			if glass_rack.can_be_clicked:
				clicked_glass_rack()

func clicked_glass_rack() -> void:
	if hand_is_full():
		if !glass_rack.is_full() and in_hand.is_empty:
			glass_rack.return_glass()
			empty_hand()
	else:
		if glass_rack.can_take_glass():
			glass_rack.take_glass()
			pick_up_glass()

func pick_up_glass() -> void:
	if !hand_is_full():
		in_hand = glass_instance.instantiate()
		add_child(in_hand)
		
		if in_hand.has_method("set_in_hand"):
			in_hand.set_in_hand()

func hand_is_full() -> bool:
	return in_hand != null

func empty_hand() -> void:
	in_hand.queue_free()
