extends KinematicBody2D

const explosion_scene = preload("res://Explosion.tscn")

func _ready():
	pass

func _process(delta):
	if get_parent().get_node("Player") != null:
		var pos = get_parent().get_node("Player").position
		look_at(pos)
		move_and_slide(Vector2(get_parent().enemy_speed, 0).rotated(rotation))
	else :
		if Globals.lastscore > Globals.highscore:
			Globals.highscore = Globals.lastscore
		get_parent().save_score()


func _on_Hitbox_area_entered(area):
	get_parent().get_node("Player").speed += 10
	Globals.lastscore += 1
	var Explosion = explosion_scene.instance()
	Explosion.position = position
	get_parent().add_child(Explosion)
	area.get_parent().queue_free()
	queue_free()

func _on_Hitbox_body_entered(body):
	get_parent().get_node("Player").speed += 10
	Globals.lastscore += 1
	var Explosion = explosion_scene.instance()
	Explosion.position = position
	get_parent().add_child(Explosion)
	body.queue_free()
	queue_free()
