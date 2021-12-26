extends StaticBody2D

func _ready():
	pass
func _process(delta):
	global_transform = get_parent().global_transform()
