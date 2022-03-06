extends Node2D

export (float, 5, 20) var remaining_time_maximum : float = 20

onready var remaining_time_scale : float = 100 / remaining_time_maximum
onready var remaining_time : float = remaining_time_maximum

onready var switchers : Node2D = $Switchers
onready var controllers : Node2D = $Controllers

func _ready() -> void:
	# Center Node
	translate(get_viewport_rect().size * .5)
	
	# Start game
	GameManager.score = 0
	randomize()
	
	for controller in controllers.get_children():
		controller.connect("switch", self, "_on_Controller_Switch", [controller, switchers.get_node(controller.switcher)])

func _process(delta) -> void:
	remaining_time -= delta
	if remaining_time < 0:
		SceneLoader.goto_scene("res://menu/menu-ui.tscn")
		set_process(false)
		
func _on_Controller_Switch(state : int, controller : Node2D, switcher : Node2D) -> void:
	if state == switcher.state:
		controller.animation_player.play("correct")
		controller.change_state()
		switcher.reset_timer()
		switcher.change_state()
		GameManager.score += 1
	else:
		controller.animation_player.play("wrong")
