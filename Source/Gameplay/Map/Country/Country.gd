extends Area2D

class_name Country

onready var sprite = $Country
onready var border = $Border

var occupier = null
var hovering = false
var selected = false
var active = false
var troops = 0

onready var country_state = load("res://Source/Gameplay/StateMachine/CountryStates/ActiveState.gd").new()
onready var name_label = $Name
onready var troops_label = $Troops
onready var active_click_audio = $ActiveClick
onready var selected_click_audio = $SelectedClick

signal troops_updated

func _ready():
	setup()

func setup():
	setup_name()
	setup_state()
	setup_troops()
	call_deferred("setup_bordering_countries")

func setup_bordering_countries():
	if GamePlay.game:
		for country_index in GamePlay.bordering_countries[name].size():
			var country_name = GamePlay.bordering_countries[name][country_index]
			if GamePlay.game.has_node("Countries/" + country_name):
				GamePlay.bordering_countries_nodes[name][country_index] = GamePlay.game.get_node("Countries/" + country_name)

func setup_troops():
	troops = 0
	connect("troops_updated", self, "update_troops_label")

func setup_name():
	name_label.text = get_name()
func setup_state():
	country_state.enter(self)

func _process(delta):
	if country_state.has_method("update"):
		var state = country_state.update(self)
		if state:
			change_state(state)

func update():
	var state = country_state.update(self)
	if state:
		change_state(state)

func change_state(state):
	var previous_state = country_state
	previous_state.exit(self)
	country_state = state
	#print(state.get_class())
	country_state.enter(self)
	previous_state.queue_free()

func get_name():
	return space_pascal_case(name)

func space_pascal_case(string):
	var index = 0
	var new_string = ""
	for letter in string:
		if index == 0:
			new_string += letter
		else:
			if letter.to_upper() == letter:
				new_string = new_string + " " + letter
			else:
				new_string += letter
		index += 1
	return new_string

func _on_mouse_entered():
	hovering = true

func _on_mouse_exited():
	hovering = false

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.is_pressed():
				country_clicked()

func country_clicked():
	var state = country_state.clicked(self)
	if state:
		change_state(state)

func _input(event):
	if event.is_action_pressed("reveal_country_names"):
		name_label.visible = !name_label.visible

func increment_troops():
	troops += 1
	emit_signal("troops_updated")

func decrement_troops():
	troops -= 1
	if troops < 0:
		troops = 0
	emit_signal("troops_updated")

func add_troops(troops_amount):
	troops += troops_amount
	emit_signal("troops_updated")

func subtract_troops(troops_amount):
	troops -= troops_amount
	emit_signal("troops_updated")

func set_troops(troops_amount):
	troops = troops_amount
	emit_signal("troops_updated")

func get_troops():
	return troops

func update_troops_label():
	troops_label.text = str(troops)

func active_player_changed(new_player):
	var state = country_state.active_player_changed(self, new_player)
	if state:
		change_state(state)

func change_country_state(state_name = ""):
	var state = country_state.change_country_state(self, state_name)
	if state:
		change_state(state)
