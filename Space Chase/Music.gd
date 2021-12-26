extends AudioStreamPlayer2D

func _ready():
	pass
func _process(delta):
	if get_parent().get_node("Player") != null:
		global_position = get_parent().get_node("Player").global_position
	yield (self, "finished")
	play()
