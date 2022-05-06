extends Spatial



onready var line = $line
onready var ray = $ray

func _process(_delta):
	line.clear()

	if ray.is_colliding():
		line.begin(Mesh.PRIMITIVE_LINES)
		line.add_vertex(Vector3.ZERO)
		line.add_vertex(transform.xform_inv(ray.get_collision_point()))
		line.end()
