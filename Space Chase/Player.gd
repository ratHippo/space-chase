extends KinematicBody2D

const audio = preload("res://Audio.tscn")
const projectile = preload("res://Projectile.tscn")
onready  var Audio = audio.instance()
var speed = 200

func _ready():
	add_child(Audio)
func _physics_process(delta):
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)
	move_and_slide(Vector2(speed, 0).rotated(rotation))
	if Input.is_action_just_pressed("Click"):
		Audio.stream = load("res://Pew.wav")
		Audio.play()
		get_node("Weapon").shoot()
		yield (Audio, "finished")



