extends KinematicBody


var forward_speed = 0.0
var forward_angle = Vector3(0, 0, -1)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# func _input(event):
# 	if event.is_action("ui_up"):
# 		forward_speed += 1

# 	if event.is_action("ui_down"):
# 		forward_speed -= 1
	
# 	if event.is_action("ui_left"):
# 		forward_angle = forward_angle.rotated(Vector3.UP, .1)

# 	if event.is_action("ui_right"):
# 		forward_angle = forward_angle.rotated(Vector3.UP, -.1)


		# match(e.scancode):
		# 	KEY_W:
		# 		forward_speed += 1
			
		# 	KEY_S:
		# 		forward_speed -= 1

		# 	KEY_A:
		# 		forward_angle = forward_angle.rotated(Vector3.UP, .1)

		# 	KEY_D:
		# 		forward_angle = forward_angle.rotated(Vector3.UP, -.1)


func _physics_process(_delta):
	if Input.get_action_strength("ui_up") > 0:
		forward_speed += .1

	if Input.get_action_strength("ui_down") > 0:
		forward_speed -= .1
	
	if Input.get_action_strength("ui_left") > 0:
		var t = transform
		t.origin = Vector3.ZERO
		t = t.rotated(Vector3.UP, .1)
		t.origin = transform.origin

		if !test_move(t, Vector3.ZERO):
			transform = t;
			forward_angle = forward_angle.rotated(Vector3.UP, .1)

	if Input.get_action_strength("ui_right") > 0:
		var t = transform
		t.origin = Vector3.ZERO
		t = t.rotated(Vector3.UP, -.1)
		t.origin = transform.origin

		if !test_move(t, Vector3.ZERO):
			transform = t;
			forward_angle = forward_angle.rotated(Vector3.UP, -.1)

	var _move_hit = move_and_collide(forward_angle.normalized() * forward_speed)

	forward_speed *= .5