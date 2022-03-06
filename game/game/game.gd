extends Node2D

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

func _on_Controller_Switch(state : int, controller : Node2D, switcher : Node2D) -> void:
	if state == switcher.state:
		controller.change_state()
		switcher.reset_timer()
		switcher.change_state()
		GameManager.score += 1


func _on_Timer_timeout():
	SceneLoader.goto_scene("res://menu/menu-ui.tscn")
