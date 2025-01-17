extends CountryState

class_name ActiveState

func enter(country: Country):
	country.active = true
	color_multiplier = 1
	.enter(country)

func handle_input(country: Country, input: InputEvent):
	return null

func update(country: Country):
	set_country_color(country)
	set_border_color(country)
	if Input.is_action_just_pressed("ui_accept"):
		return country_states.in_active.new()

func exit(country: Country):
	set_border_color(country)

func clicked(country: Country):
	if GamePlay.country_sound:
		country.active_click_audio.play()
	GamePlay.game.active_player.country_clicked(country)

func active_player_changed(country: Country, new_player: Player):
	if new_player.player_state is PlacementState or new_player.player_state is FortifyState:
		if country.occupier and country.occupier != new_player:
			return country_states.in_active.new()

func get_class():
	return "Active State"

func change_country_state(country: Country, state_name = ""):
	if state_name == "selected":
		return country_states.selected.new()
	if state_name == "in_active":
		return country_states.in_active.new()
