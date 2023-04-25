extends Node

var next_background_states = []

# Color functions	
func get_character_next_state(character_state):
	var states = Constants.StateEnum.values().duplicate()
	states.erase(character_state)
	return states.pick_random()

func get_background_next_state(background_state, character_state):
	# Make a list that would end during the next combo
	if next_background_states.is_empty():
		var states = Constants.StateEnum.values().duplicate()
		var states_size: int = states.size()
		states.erase(background_state)
		states.shuffle()
		
		var character_state_index: int = states.find(character_state)
		next_background_states = states.slice(0, character_state_index + 1)
	
	# give the next state already calculated
	var next_state = next_background_states.pop_front()
	Constants.state_matches = next_state == character_state
	return next_state
