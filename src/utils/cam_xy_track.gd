extends Camera

export(NodePath) var track_this;
var track;

func _ready():
	track = get_node(track_this)

func _process(_delta):
	translation = Vector3(
		track.translation.x,
		translation.y,
		track.translation.z )
