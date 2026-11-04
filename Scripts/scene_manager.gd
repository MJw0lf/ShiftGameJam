extends Node2D

var in_hand : Sprite2D
var glass_instance : PackedScene = preload("res://Objects/glass.tscn")

func hand_is_full() -> bool:
	return in_hand != null
