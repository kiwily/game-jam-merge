extends Node

@export var BonusText: PackedScene
@export var CountDown: PackedScene

func _ready():
	$Game/Game.setup()
	$ChangeState.wait_time = Constants.background_delta
	$ChangeState.start()

func score():
	print('You scored!')
	if randf() <= 0.3:
		# Note: (old) was changing mode here one every three success (from 1 tile to 4 tiles)
		$PostEffect.play_shockwave(Constants.shockwave_force_strong, Constants.shockwave_thickness_strong)
	else:
		$PostEffect.play_shockwave()
		
func update_ChangeState_wait_time():
	if ($ChangeState.wait_time != Constants.swap_delta):
		$ChangeState.stop()
		$ChangeState.wait_time = Constants.swap_delta
		$ChangeState.start()

func wrong():
	print("You missed!")

func display(text, position_base):
	var bonus_text = BonusText.instantiate()
	bonus_text.text = text
#	Calculate random offset (TODO)
	bonus_text.position = position_base + Vector2(randf_range(-64, 64), randf_range(-64, 64)) # randomise
	add_child(bonus_text)

func _on_Pause_pressed():
	Constants.pause = true
	Session.pause_with_opacity()

func _on_ChangeState_timeout():
	if not Constants.pause:
		SoundManager.play_change_state()
		$Game/Game.update_background_state()
		update_ChangeState_wait_time()
