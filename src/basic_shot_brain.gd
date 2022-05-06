extends RayCast

var hit = false
var ticker = 0.0



func _process(delta):
	if !hit:
		if is_colliding():
			print("hit found")
	
			var hit_point = transform.xform_inv(get_collision_point())

			$line.clear()
			$line.begin(Mesh.PRIMITIVE_LINES)
			$line.add_vertex(Vector3.ZERO)
			$line.add_vertex(hit_point)
			$line.end()
	
			$stop.translation = hit_point

		hit = true
	
	ticker += delta
	if ticker > 3:
		queue_free()
		print("fade")
