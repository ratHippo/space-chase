extends AudioStreamPlayer2D

func _ready():
	pass
func _play(sound):
	stream = load(sound)
	yield (self, "finished")
	queue_free()
