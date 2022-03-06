extends Node2D

signal switch(state)

export (String) var switcher : String

var state : int = -1

onready var sprite : Sprite = $Node2D/Sprite
onready var animation_player : AnimationPlayer = $AnimationPlayer
onready var audio_stream_player_click : AudioStreamPlayer = $AudioStreamPlayerClick

func _ready():
	change_state()

func change_state() -> void:
	var new_state : int = randi() % (GameManager.states.size() - 1)
	if state == new_state:
		state = new_state + 1
	else:
		state = new_state
	update_state()

func update_state() -> void:
	sprite.material.set_shader_param("color", GameManager.states[state])

func _on_Area2D_input_event(_viewport, event, _shape_idx) -> void:
	if event is InputEventScreenTouch and event.pressed:
		audio_stream_player_click.play()
		emit_signal("switch", state)
