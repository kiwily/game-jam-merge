extends Node2D

signal switch(state)

export (String) var switcher : String

var state : int = -1

onready var sprite : Sprite = $Sprite

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
		emit_signal("switch", state)
