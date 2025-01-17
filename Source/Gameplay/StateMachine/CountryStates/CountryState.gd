extends StateMachine

class_name CountryState

var colors = {
	"unoccupied": Color.white,
	"hover": Color.white,
	"not_hover": Color.black,
	"unoccoupied_border": Color.silver
}

var country_states = {
	"in_active": load("res://Source/Gameplay/StateMachine/CountryStates/InActiveState.gd"),
	"active": load("res://Source/Gameplay/StateMachine/CountryStates/ActiveState.gd"),
	"selected": load("res://Source/Gameplay/StateMachine/CountryStates/SelectedState.gd"),
}

var color_multiplier = 1
var hover_multiplier = 1.25

func enter(country: Country):
	set_country_color(country)
	dim_country_color(country)
	set_border_color(country)

func handle_input(country: Country, input: InputEvent):
	return null

func update(country: Country):
	pass

func exit(country: Country):
	pass

func clicked(country: Country):
	pass

func change_state(country: Country, state):
	country.change_state(state)

func set_country_color(country: Country):
	if country.occupier:
		country.sprite.modulate = GamePlay.colors[country.occupier.name]
	else:
		country.sprite.modulate = colors.unoccupied

func set_border_color(country: Country):
	if country.occupier:
		country.troops_label.visible = true
	else:
		country.troops_label.visible = false
	if not country.active:
		country.border.modulate = colors.not_hover
		country.z_index = 0
		country.name_label.visible = false
		return
	if country.hovering or country.selected:
		country.border.modulate = colors.hover
		dim_border_color(country)
		country.name_label.visible = true
		country.z_index = 2
	else:
		country.z_index = 0
		country.name_label.visible = false
		country.border.modulate = colors.not_hover
	if not country.occupier:
		country.border.modulate = colors.unoccoupied_border

func dim_border_color(country: Country):
	country.border.modulate.r *= hover_multiplier
	country.border.modulate.g *= hover_multiplier
	country.border.modulate.b *= hover_multiplier

func dim_country_color(country: Country):
	country.sprite.modulate.r *= color_multiplier
	country.sprite.modulate.g *= color_multiplier
	country.sprite.modulate.b *= color_multiplier

func active_player_changed(country: Country, new_player: Player):
	pass

func change_country_state(country: Country, state_name = ""):
	pass
