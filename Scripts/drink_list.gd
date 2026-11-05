extends Node

const drinks : Dictionary[String, Array] = {
	"Empty" : [],
	"Beer" : ["Beer"],
	"Cider" : ["Cider"]
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
