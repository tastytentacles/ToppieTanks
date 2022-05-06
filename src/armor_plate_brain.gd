extends KinematicBody
class_name ArmorPlate

var health = 100

var health_scaler = 1.0 setget , _update_scaler

onready var mat_cahce = ($mesh.get_active_material(0) as ShaderMaterial).duplicate()

# func _ready():
# 	var m = $mesh.get_active_material(0) as ShaderMaterial
# 	m.set_shader_param("Life", 1)
# 	$mesh.set_surface_material(0, m)

func damage(d):
	health = clamp(health - d, 0, 100)

	mat_cahce.set_shader_param("Life", self.health_scaler)
	$mesh.set_surface_material(0, mat_cahce)

	if health == 0:
		queue_free()
	
	print(self.health_scaler)
	print("damage " + str(d) + ", health left " + str(health))

func _update_scaler():
	return 1 - (health / 100.0)
