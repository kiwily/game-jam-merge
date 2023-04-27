extends Node

func score(): 
	increment_combos_strike()
	Constants.score += Constants.score_factor * Constants.lives * Constants.combos_strike
	$GameUI.update_score(Constants.score)
	
		
func increment_combos_strike():
	Constants.combos_strike += 1
	if Constants.combos_strike % Constants.combos_reward_strike == 0:
		earn_life()
	
	if Constants.combos_strike >= 2:
		$PostEffect.play_shockwave()
		$GameUI.display_bonus_text('x' + str(Constants.combos_strike))
	
func reset_combos_strike():
	Constants.combos_strike = 0

func earn_life():
	if Constants.lives < Constants.max_lives:
		$GameUI.earn_heart()
		Constants.lives += 1

func lose_life():
	$GameUI.lose_heart()
	Constants.lives -= 1
	if Constants.lives == 0:
		$GameUI.visible = false
		# TODO: lose is a bit straighforward, a little animation won't hurt
		Session.lose()

func wrong():
	reset_combos_strike()
	lose_life()

func _on_game_miss():
	reset_combos_strike()
