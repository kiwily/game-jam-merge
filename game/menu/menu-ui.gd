extends Control

export (String) var game_scene_path : String = "res://game/game.tscn"

func _ready():
	$MarginContainer/CenterContainer/VBoxContainer/Label.text = "Score - %d" % GameManager.score

func _on_StartButton_pressed():
	SceneLoader.goto_scene(game_scene_path)
