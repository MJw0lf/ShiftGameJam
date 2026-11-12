extends Node

const drinks : Dictionary[String, Array] = {
	"Empty" : [],
	"Beer" : ["Beer"],
	"Cider" : ["Cider"],
	"RedWine" : ["RedWine"],
	"WhiteWine" : ["WhiteWine"]
}

func find_drink(ingredients : Array) -> String:
	
	for drink in drinks:
		if drinks[drink].size() == ingredients.size():
			var is_drink : bool = true
			for ingredient in ingredients:
				var has_ingr : bool = false
				for drink_ingr in drinks[drink]:
					if drink_ingr == ingredient:
						has_ingr = true
				if !has_ingr:
					is_drink = false
			if is_drink:
				return drink
	
	return "NoDrink"

func get_random_drink() -> String:
	var random_drink : String = drinks.keys()[randi() % drinks.size()]
	while random_drink == "Empty":
		random_drink = drinks.keys()[randi() % drinks.size()]
	return random_drink
