extends Node

var colors = {
	"1": Color.orange,
	"2": Color.lightblue,
	"3": Color.yellow,
	"4": Color.lightsalmon,
	"5": Color.lightgreen,
	"6": Color.lightcoral
}
var total_countries_in_continents = {
	"NorthAmerica": 9,
	"SouthAmerica": 4,
	"Europe": 7,
	"Africa": 6,
	"Asia": 12,
	"Australia": 4
}
var bordering_countries = {
	"Afghanistan": ["China", "India", "MiddleEast", "Ukraine", "Ural"],
	"Alaska": ["Kamchatka", "NorthwestTerritory", "Alberta"],
	"Alberta": ["Alaska", "NorthwestTerritory", "Ontario", "WesternUnitedStates"],
	"Argentina": ["Brazil", "Peru"],
	"Brazil": ["Argentina", "Peru", "Venezuela"],
	"CentralAmerica": ["EasternUnitedStates", "WesternUnitedStates", "Venezuela"],
	"China": ["India", "Afghanistan", "Mongolia", "Siberia", "Ural", "Siam"],
	"Congo": ["NorthAfrica", "EastAfrica", "SouthAfrica"],
	"EastAfrica": ["NorthAfrica", "Congo", "SouthAfrica", "Madagascar", "Egypt"],
	"EasternAustralia": ["NewGuinea", "WesternAustralia"],
	"EasternUnitedStates": ["WesternUnitedStates", "CentralAmerica", "Ontario", "Quebec"],
	"Egypt": ["NorthAfrica", "EastAfrica", "MiddleEast", "SouthernEurope"],
	"GreatBritain": ["WesternEurope", "NorthernEurope", "Iceland", "Scandinavia"],
	"Greenland": ["Quebec", "NorthwestTerritory", "Iceland", "Ontario"],
	"Iceland": ["GreatBritain", "Scandinavia", "Greenland"],
	"India": ["Afghanistan", "China", "MiddleEast", "Siam"],
	"Indonesia": ["NewGuinea", "WesternAustralia", "Siam"],
	"Irkutsk": ["Mongolia", "Siberia", "Yakutsk", "Kamchatka"],
	"Japan": ["Mongolia", "Kamchatka"],
	"Kamchatka": ["Mongolia", "Japan", "Yakutsk", "Irkutsk", "Alaska"],
	"Madagascar": ["SouthAfrica", "EastAfrica"],
	"MiddleEast": ["Egypt", "EastAfrica", "SouthernEurope", "Ukraine", "Afghanistan", "India"],
	"Mongolia": ["China", "Japan", "Siberia", "Irkutsk", "Kamchatka"],
	"NewGuinea": ["WesternAustralia", "EasternAustralia", "Indonesia"],
	"NorthAfrica": ["Brazil", "Congo", "EastAfrica", "Egypt", "SouthernEurope", "WesternEurope"],
	"NorthernEurope": ["GreatBritain", "Ukraine", "Scandinavia", "SouthernEurope", "WesternEurope"],
	"NorthwestTerritory": ["Alaska", "Greenland", "Alberta", "Ontario"],
	"Ontario": ["Quebec", "NorthwestTerritory", "Alberta", "Greenland", "WesternUnitedStates"],
	"Peru": ["Argentina", "Brazil", "Venezuela"],
	"Quebec": ["EasternUnitedStates", "Ontario", "Greenland"],
	"Scandinavia": ["Iceland", "GreatBritain", "Ukraine", "NorthernEurope"],
	"Siam": ["Indonesia", "India", "China"],
	"Siberia": ["Irkutsk", "Mongolia", "China", "Yakutsk", "Ural"],
	"SouthAfrica": ["Congo", "EastAfrica", "Madagascar"],
	"SouthernEurope": ["Egypt", "NorthAfrica", "MiddleEast", "Ukraine", "NorthernEurope", "WesternEurope"],
	"Ukraine": ["Afghanistan", "Scandinavia", "MiddleEast", "Ural", "NorthernEurope", "SouthernEurope"],
	"Ural": ["Afghanistan", "China", "Siberia", "Ukraine"],
	"Venezuela": ["Brazil", "Peru", "CentralAmerica"],
	"WesternAustralia": ["EasternAustralia", "NewGuinea", "Indonesia"],
	"WesternEurope": ["NorthAfrica", "GreatBritain", "NorthernEurope", "SouthernEurope"],
	"WesternUnitedStates": ["Alberta", "Ontario", "EasternUnitedStates", "CentralAmerica"],
	"Yakutsk": ["Kamchatka", "Irkutsk", "Siberia"],
}

var game: Game

func _ready():
	pass
