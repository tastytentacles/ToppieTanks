extends KinematicBody

export var speed = .5
export var turn_speed = .9
export var friction = .75

var forward_speed = 0.0
var forward_angle = Vector3(0, 0, -1)



# func _process(delta):
# 	if Input.get_action_strength("ui_up") > 0:
# 		forward_speed += speed * delta

# 	if Input.get_action_strength("ui_down") > 0:
# 		forward_speed -= speed * delta

# 	if Input.get_action_strength("ui_left") > 0:
# 		forward_angle = forward_angle.rotated(Vector3.UP, turn_speed * delta)

# 	if Input.get_action_strength("ui_right") > 0:
# 		forward_angle = forward_angle.rotated(Vector3.UP, -turn_speed * delta)

func _physics_process(_delta):
	# if Input.get_action_strength("ui_up") > 0:
	# 	forward_speed += speed * delta

	# if Input.get_action_strength("ui_down") > 0:
	# 	forward_speed -= speed * delta
	
	# if Input.get_action_strength("ui_left") > 0:
	# 	var t = transform
	# 	t.origin = Vector3.ZERO
	# 	t = t.rotated(Vector3.UP, turn_speed * delta)
	# 	t.origin = transform.origin

	# 	if !test_move(t, Vector3.ZERO):
	# 		transform = t;
	# 		forward_angle = forward_angle.rotated(Vector3.UP, turn_speed * delta)

	# if Input.get_action_strength("ui_right") > 0:
	# 	var t = transform
	# 	t.origin = Vector3.ZERO
	# 	t = t.rotated(Vector3.UP, -turn_speed * delta)
	# 	t.origin = transform.origin

	# 	if !test_move(t, Vector3.ZERO):
	# 		transform = t;
	# 		forward_angle = forward_angle.rotated(Vector3.UP, -turn_speed * delta)

	transform = transform.looking_at(translation + forward_angle, Vector3.UP)

	var _move_hit = move_and_collide(forward_angle.normalized() * forward_speed)

	forward_speed *= friction
