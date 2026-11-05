extends Sprite2D

@onready var drink_label : Label = $DrinkLabel

var can_be_clicked : bool = false

var drink_wants : String = ""
var gotten_drink : bool = false

func _ready() -> void:
	drink_wants = DrinkList.get_random_drink()
	drink_label.text = drink_wants

func _physics_process(delta: float) -> void:
	if gotten_drink:
		queue_free()

func is_right_drink(given_drink : String) -> bool:
	gotten_drink = drink_wants == given_drink
	
	return gotten_drink

func _on_mouse_entered() -> void:
	can_be_clicked = true

func _on_mouse_exited() -> void:
	can_be_clicked = false
