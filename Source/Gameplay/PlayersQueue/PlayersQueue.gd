extends Node2D

class_name PlayersQueue

var active_player = null
var active_index = -1

signal active_player_changed(active_index, active_player)

func _ready():
	setup()

func connect_signals():
	for child in get_children():
		if child.has_signal("turn_completed"):
			child.connect("turn_completed", self, "next_turn")

func setup():
	connect_signals()
	play_first_turn()

func play_first_turn():
	if get_child_count() > 0:
		next_turn()

func next_turn():
	active_index += 1
	if active_index >= get_child_count():
		active_index = 0
	active_player  = get_child(active_index)
	active_player.set_active(true)
	emit_signal("active_player_changed", active_index, active_player)
