extends Control

onready var texture_progress : TextureProgress = $MarginContainer/CenterContainer/TextureProgress
onready var game : Node2D = $Game

func _process(_delta) -> void:
	update_progress()

func update_progress() -> void:
	print(game.remaining_time * game.remaining_time_scale)
	texture_progress.value = game.remaining_time * game.remaining_time_scale
