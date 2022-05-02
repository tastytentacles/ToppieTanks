extends "res://src/tank_brain.gd"

func _process(delta):
	if Input.get_action_strength("ui_up") > 0:
		forward_speed += speed * delta

	if Input.get_action_strength("ui_down") > 0:
		forward_speed -= speed * delta

	if Input.get_action_strength("ui_left") > 0:
		forward_angle = forward_angle.rotated(Vector3.UP, turn_speed * delta)

	if Input.get_action_strength("ui_right") > 0:
		forward_angle = forward_angle.rotated(Vector3.UP, -turn_speed * delta)
