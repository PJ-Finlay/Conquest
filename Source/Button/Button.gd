extends Button

class_name SmartButton

onready var pressed_audio = $Pressed
onready var focused_audio = $Focused

func button_pressed():
	pressed_audio.play()

func focus_entered():
	pass
	#focused_audio.play()
