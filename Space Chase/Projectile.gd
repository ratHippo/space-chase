extends KinematicBody2D

export (Texture) var texture
export  var speed = 500
export (PoolVector2Array) var collision_shape
var angle = null

func _ready():
	get_node("Sprite").texture = texture
	get_node("Area2D/CollisionPolygon2D").polygon = collision_shape
func _physics_process(delta):
	if angle != null:
		rotation = angle
		move_and_slide(Vector2(speed, 0).rotated(rotation))

func _on_Area2D_area_entered(area):
	pass

func _on_Area2D_body_entered(body):
	queue_free()
