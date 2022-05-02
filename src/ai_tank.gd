extends "res://src/tank_brain.gd"

var tick = 0.0
var turn_dazze = 0.0

var target = Vector3.ZERO
var target_dist = 0

func random_pos() -> Vector3:
	var size = 2.5
	var rtn = translation + Vector3(
		rand_range(size, -size),
		0,
		rand_range(size, -size) )
	
	target_dist = translation.distance_to(rtn)
	
	return rtn

	

func _ready():
	randomize()
	target = random_pos()

func _process(delta):
	tick += delta
	turn_dazze = max(turn_dazze - delta, 0)

	var to_target = translation.direction_to(target)
	var dist_to_target = translation.distance_to(target)
	var dist_scaller = min(dist_to_target / target_dist, 1)
	var angle_calc = forward_angle.distance_to(to_target.normalized()) / 2

	# print(str(dist_scaller) + " :: " + str(angle_calc))
	
	$Debug/path.clear()
	$Debug/path.begin(PrimitiveMesh.PRIMITIVE_LINES)
	$Debug/path.add_vertex(Vector3.ZERO)
	$Debug/path.add_vertex(transform.xform_inv(target))
	$Debug/path.end()

	forward_speed = speed / 4

	if !$turn_ray.is_colliding():
		if angle_calc > .01 && turn_dazze == 0:
			forward_angle = forward_angle.linear_interpolate(
				to_target,
				.05).normalized()
	else :
		turn_dazze = 2.5

		var c_normal = $turn_ray.get_collision_normal()
		var c_pos = $turn_ray.get_collision_point()
		if angle_calc > .01:
			forward_angle = forward_angle.linear_interpolate(
				translation.direction_to(c_pos + c_normal),
				.5).normalized()

	if angle_calc > .33:
		forward_speed = speed / 16	

	# if stop_zone_bodycount.size() > 0:
	# 	target = random_pos()

	if tick > 10 || dist_to_target < .3:
		target = random_pos()
		
		tick = 0.0
