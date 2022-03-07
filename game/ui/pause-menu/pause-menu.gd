extends CanvasLayer

func set_visible_to(value):
	$Control.visible = value

func _on_Continue_pressed():
	SoundManager.play_click()
	Constants.pause = false
	Session.unpause()


func _on_MainMenu_pressed():
	SoundManager.play_click()
	Constants.pause = false
	Session.main_menu()


func _on_Restart_pressed():
	SoundManager.play_click()
	Constants.pause = false
	Session.start_game()
