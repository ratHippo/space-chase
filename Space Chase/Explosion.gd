extends AnimatedSprite

func _ready():
	$AudioStreamPlayer2D.playing = true
	playing = true
	yield (self, "animation_finished")
	queue_free()
