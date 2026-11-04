extends Node2D

var in_hand : Sprite2D
var glass_instance : PackedScene = preload("res://Objects/glass.tscn")

func _ready() -> void:
	#pick_up_glass()
	
	pass

func pick_up_glass() -> void:
	if !hand_is_full():
		in_hand = glass_instance.instantiate()
		add_child(in_hand)
		
		if in_hand.has_method("set_in_hand"):
			in_hand.set_in_hand()

func hand_is_full() -> bool:
	return in_hand != null

func empty_hand() -> void:
	in_hand = null
