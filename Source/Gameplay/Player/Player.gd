extends Node2D

class_name Player

var is_active = false
var reinforcement = 0
var countries_occupied = 0
var countries = []
var countries_occupied_in_continents = {
	"NorthAmerica": 0,
	"SouthAmerica": 0,
	"Europe": 0,
	"Africa": 0,
	"Asia": 0,
	"Australia": 0
}
var first_turn = true

var initial_troops = 9

onready var player_state = load("res://Source/Gameplay/StateMachine/PlayerStates/PlacementState.gd").new()

signal turn_completed

func _ready():
	setup()

func setup():
	set_active(false)
	setup_reinforcements()
	setup_state()

func set_initial_troops(amount):
	initial_troops = amount

func setup_state():
	player_state.enter(self)

func all_troops_placed():
	var state = player_state.all_troops_placed(self)
	if state:
		change_state(state)

func change_state(state):
	print("Player ", name, " state changed.")
	var previous_state = player_state
	previous_state.exit(self)
	player_state = state
	print("Previous state: ", previous_state.get_class())
	print("New state: ", player_state.get_class())
	previous_state.queue_free()
	player_state.enter(self)

func setup_reinforcements():
	reinforcement = randi() % 10 + 3

func _input(event):
	if not is_active:
		return
	if event.is_action_pressed("move"):
		move()

func move():
	reinforcement -= 3
	if reinforcement < 0:
		reinforcement = 0
	set_active(false)
	emit_signal("turn_completed")

func set_active(value):
	is_active = value
	set_process_input(value)

func country_clicked(country: Country):
	var state = player_state.country_clicked(self, country)
	if state:
		change_state(state)

func _process(delta):
	var state = player_state.update(self)
	if state:
		change_state(state)
