extends Control

@onready var ui : Control

@onready var drink_container = $Paper/MarginContainer/VBoxContainer/ScrollContainer/DrinkContainer
@onready var drink_text_instance : PackedScene = preload("res://UI/drink_text.tscn")

func _ready() -> void:
	ui = get_parent()
	
	update_drink_container()

func update_drink_container() -> void:
	for drink in drink_container.get_children():
		drink.queue_free()
	
	for drink in DrinkList.get_drinks():
		var drink_ingredients : Array = DrinkList.get_ingredients(drink)
		
		if drink_ingredients.size() > 1:
			var new_drink_text : String = drink + " : "
			
			for drink_index in drink_ingredients.size():
				if drink_index > 0:
					new_drink_text += ", "
				elif drink_index == drink_ingredients.size() - 1 and drink_index != 0:
					new_drink_text += " and "
				new_drink_text += drink_ingredients[drink_index]
			
			var new_drink_label : Label = drink_text_instance.instantiate()
			new_drink_label.text = new_drink_text
			drink_container.add_child(new_drink_label)

func _close_drink_ui() -> void:
	if ui:
		ui.close_drink_ui()
