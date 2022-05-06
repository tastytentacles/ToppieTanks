extends RayCast

export var damage = 25

onready var line = $line

var hit = false
var ticker = 0.0



func _process(delta):
	if !hit:
		if is_colliding():
			print("hit found")
	
			var hit_point = transform.xform_inv(get_collision_point())

			line.clear()
			line.begin(Mesh.PRIMITIVE_LINES)
			line.add_vertex(Vector3.ZERO)
			line.add_vertex(hit_point)
			line.end()
	
			$stop.translation = hit_point

			var hit_obj = get_collider()

			print(hit_obj.name)
			if (hit_obj is ArmorPlate):
				hit_obj.damage(damage)

		hit = true
	
	ticker += delta
	if ticker > 3:
		queue_free()
		print("fade")
