extends Node

const drinks : Dictionary[String, Array] = {
	"Empty" : [],
	"Beer" : ["Beer"],
	"Cider" : ["Cider"],
	"Red Wine" : ["RedWine"],
	"White Wine" : ["WhiteWine"],
	"Vodka Shot" : ["Vodka"],
	"Tequila Shot" : ["Tequila"],
	"Gin" : ["Gin"],
	"Rum" : ["Rum"],
	"Rum & Coke" : ["Rum", "Cola"],
	"Cuba Libre" : ["Rum", "Cola", "LimeJuice"],
	"Vodka Soda" : ["Vodka", "SodaWater"],
	"Gin & Tonic" : ["Gin", "TonicWater"],
	"Vodka Tonic" : ["Vodka", "TonicWater"],
	"Tequila Soda" : ["Tequila", "SodaWater"],
	"Tequila & Coke" : ["Tequila", "Cola"],
	"Screwdriver" : ["Vodka", "OrangeJuice"],
	"Tequila Sunrise" : ["Tequila", "OrangeJuice"],
	"Rum Orange" : ["Rum", "OrangeJuice"],
	"Gin Orange" : ["Gin", "OrangeJuice"],
	"Gimlet" : ["Gin", "LimeJuice"],
	"Vodka Gimlet" : ["Vodka", "LimeJuice"],
	"Daiquiri" : ["Rum", "LimeJuice"],
	"Tequila Lime Shot" : ["Tequila", "LimeJuice"],
	"Gin Rickey" : ["Gin", "LimeJuice", "SodaWater"],
	"Vodka Rickey" : ["Vodka", "LimeJuice", "SodaWater"],
	"Rum Rickey" : ["Rum", "LimeJuice", "SodaWater"],
	"Tequila Rickey" : ["Tequila", "LimeJuice", "SodaWater"],
	"Tom Collins" : ["Gin", "LemonJuice", "SodaWater"],
	"Vodka Collins" : ["Vodka", "LemonJuice", "SodaWater"],
	"Rum Collins" : ["Rum", "LemonJuice", "SodaWater"],
	"Tequila Collins" : ["Tequila", "LemonJuice", "SodaWater"],
	"Gin Sour" : ["Gin", "LemonJuice"],
	"Vodka Sour" : ["Vodka", "LemonJuice"],
	"Rum Sour" : ["Rum", "LemonJuice"],
	"Tequila Sour" : ["Tequila", "LemonJuice"],
	"Gin Lemon Tonic" : ["Gin", "LemonJuice", "TonicWater"],
	"Vodka Lemon Tonic" : ["Vodka", "LemonJuice", "TonicWater"],
	"Citrus Punch" : ["OrangeJuice", "LemonJuice"],
	"Citrus Soda" : ["OrangeJuice", "LemonJuice", "SodaWater"]
}

var current_level_drinks : Dictionary[String, Array] = {}

func _ready() -> void:
	current_level_drinks = drinks

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

func get_drinks() -> Dictionary[String, Array]:
	return current_level_drinks

func get_ingredients(drink_name : String) -> Array:
	return drinks[drink_name]
