extends "res://src/tank_brain.gd"



func _process(delta):
	if Input.get_action_strength("game_forward") > 0:
		forward_speed += speed * delta

	if Input.get_action_strength("game_back") > 0:
		forward_speed -= speed * delta

	if Input.get_action_strength("game_left") > 0:
		forward_angle = forward_angle.rotated(Vector3.UP, turn_speed * delta)

	if Input.get_action_strength("game_right") > 0:
		forward_angle = forward_angle.rotated(Vector3.UP, -turn_speed * delta)

	if Input.get_action_strength("game_turn_left") > 0:
		turret_angle = turret_angle.rotated(Vector3.UP, turn_speed * delta)

	if Input.get_action_strength("game_turn_right") > 0:
		turret_angle = turret_angle.rotated(Vector3.UP, -turn_speed * delta)
	
	if Input.get_action_strength("game_fire") > 0:
		fire()
