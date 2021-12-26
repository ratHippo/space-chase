extends Node2D

var projectile_scene = preload("res://Projectile.tscn")
export (int) var speed
export (int) var cooldown
export (Texture) var texture
export (Texture) var projectile_texture
export (PoolVector2Array) var projectile_collision_shape
var time = 0

func _ready():
	get_node("Sprite").texture = texture
func _process(delta):
	time += delta
func shoot():
	if time > cooldown:
		time = 0
		var projectile = projectile_scene.instance()
		projectile.speed = speed
		projectile.texture = projectile_texture
		projectile.angle = global_rotation
		projectile.global_position = global_position + Vector2(75, 0).rotated(global_rotation)
		projectile.collision_shape = projectile_collision_shape
		get_parent().get_parent().add_child(projectile)
