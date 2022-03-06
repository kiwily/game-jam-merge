extends Node2D


var state : int = -1

onready var sprite : Sprite = $Sprite
onready var timer : Timer = $Timer

func _ready():
	change_state()

func reset_timer() -> void:
	timer.start()

func change_state() -> void:
	var new_state : int = randi() % (GameManager.states.size() - 1)
	if state == new_state:
		state = new_state + 1
	else:
		state = new_state
	update_state()

func update_state() -> void:
	sprite.material.set_shader_param("color", GameManager.states[state])

func _on_Timer_timeout() -> void:
	change_state()
