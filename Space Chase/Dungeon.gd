extends Node2D
export (Script) var game_save_class
var enemy_speed = 100
var player_map_pos = Vector2(0, 0)
onready  var player = $Player
var seed_var = 0
var unloads = [Vector2( - 48, - 48), Vector2( - 48, - 16), Vector2( - 48, 16), Vector2( - 16, - 48), Vector2( - 16, 16), Vector2(16, - 48), Vector2(16, - 16), Vector2(16, 16)]
const enemy_scene = preload("res://Enemy.tscn")
var time = 0
var spawn_wait = 1

func _ready():
	Globals.lastscore = 0
	randomize()
func load_map(minX, minY, lenX, lenY):
	for xmod in range(lenX):
		for ymod in range(lenY):
			if $TileMap.get_cell(minX + xmod, minY + ymod) != 1 and $TileMap.get_cell(minX + xmod, minY + ymod) != 0:
				if randi() % 20 == 0:
					$TileMap.set_cell(minX + xmod, minY + ymod, 0)
				else :
					$TileMap.set_cell(minX + xmod, minY + ymod, 1)
func unload_map(minX, minY, lenX, lenY):
	for xmod in range(lenX):
		for ymod in range(lenY):
			$TileMap.set_cell(minX + xmod, minY + ymod, - 1)
func _process(delta):
	if get_node("Player") != null:
		time += delta
		if time >= spawn_wait:
			time -= spawn_wait
			var Enemy = enemy_scene.instance()
			randomize()
			Enemy.global_position = get_node("Player").global_position + Vector2(rand_range( - 500, - 200), rand_range( - 500, 500)).rotated(get_node("Player").global_rotation)
			add_child(Enemy)
			enemy_speed += 5
		player_map_pos = player.global_position / 64
		player_map_pos.y = int(player_map_pos.y)
		player_map_pos.x = int(player_map_pos.x)
		load_map(player_map_pos.x - 16, player_map_pos.y - 16, 32, 32)
		for i in unloads:
			unload_map(player_map_pos.x + i.x, player_map_pos.y + i.y, 32, 32)
		
	else :
		if Globals.lastscore > Globals.highscore:
			Globals.highscore = Globals.lastscore
		save_score()
func save_score():
	var new_save = game_save_class.new()
	new_save.highscore = Globals.highscore
	new_save.lastscore = Globals.lastscore
	ResourceSaver.save("user://Save.tres", new_save)
	get_tree().change_scene("res://Home.tscn")
