extends KinematicBody

export var speed = .5
export var turn_speed = .9
export var friction = .75

var forward_speed = 0.0
var forward_angle = Vector3(0, 0, -1)
var turret_angle = Vector3(0, 0, -1)

var muzzle_clear = false setget , _check_muzzle



func _physics_process(_delta):
	transform = transform.looking_at(translation + forward_angle, Vector3.UP)
	$turret.transform = $turret.transform.looking_at(
		$turret.translation + turret_angle, Vector3.UP )

	var _move_hit = move_and_collide(forward_angle.normalized() * forward_speed)

	forward_speed *= friction

func _check_muzzle():
	return min($turret/muzzle_box.get_overlapping_bodies().size(), 1)
