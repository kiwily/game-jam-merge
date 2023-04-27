extends ColorRect

const MIN_RADIUS: float = 1
const MAX_RADIUS: float = 2
const MAX_LEVEL: float = 10
const RADIUS_STEP: float = (MAX_LEVEL - MIN_RADIUS) / MAX_LEVEL

var tween: Tween

var level: int = -1:
	get:
		return level
	set(value):
		level = clamp(value, -1, MAX_LEVEL)
		if level == -1:
			reset_tween()
			# need to set and remove visible to not overload tree
			tween.tween_property(material, "shader_parameter/radius", 5, 0.5)
		elif level == 0:
			reset_tween()
			# need to set and remove visible to not overload tree
			tween.tween_property(material, "shader_parameter/radius", 2, 0.5)
		else:
			material.set_shader_parameter("radius", MIN_RADIUS + RADIUS_STEP * level)
		
func reset_tween():
	if tween:
		tween.kill() # Abort the previous animation.
	tween = get_tree().create_tween().bind_node(self)
