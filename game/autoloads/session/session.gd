extends Node

export (String, FILE, "*.tscn") var game_path = "res://game/game-master.tscn"
export (String, FILE, "*.tscn") var main_menu_path = "res://ui/main-menu/main-menu.tscn"
export (String, FILE, "*.tscn") var leaderboard_path = "res://ui/leaderboard/leaderboard.tscn"

func _ready():
	randomize()
	var err = NetworkManager.connect("insert", self, "_on_NetworkManager_insert")
	if err != OK:
		printerr("[Error] Cannot connect NetworkManager <insert> to <_on_NetworkManager_insert>")
	
func pause_with_opacity():
	get_tree().paused = true
	$PauseMenu.set_visible_to(true)

func unpause():
	$LoseMenu.set_visible_to(false)
	$PauseMenu.set_visible_to(false)
	get_tree().paused = false

func start_game():
	Constants.score = 0
	Constants.level = 0
	Constants.combo = 0
	SoundManager.play_click()
	unpause()
	var err = get_tree().change_scene(game_path)
	if err != OK:
		printerr("[Error] Change scene to %s returns: %d" % [game_path, err])
	
func leaderboard():
	SoundManager.play_click()
	unpause()
	var err = get_tree().change_scene(leaderboard_path)
	if err != OK:
		printerr("[Error] Change scene to %s returns: %d" % [leaderboard_path, err])
	
func main_menu():
	SoundManager.play_click()
	unpause()
	var err = get_tree().change_scene(main_menu_path)
	if err != OK:
		printerr("[Error] Change scene to %s returns: %d" % [main_menu_path, err])
	
func lose():
	SoundManager.play_lost()
	
	get_tree().paused = true
	$PauseMenu.set_visible_to(false)
	$LoseMenu.set_visible_to(true)


func submit_score(score, name):
	NetworkManager.insert(score, name)


func _on_NetworkManager_insert(_result):
	unpause()
	var err = get_tree().change_scene(leaderboard_path)
	if err != OK:
		printerr("[Error] Change scene to %s returns: %d" % [leaderboard_path, err])

