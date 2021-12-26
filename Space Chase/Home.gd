extends Node2D

export (Script) var game_save_class

func _ready():
	load_score()
func load_score():
	var save = load("user://Save.tres")
	if save != null:
		Globals.highscore = save.highscore
		Globals.lastscore = save.lastscore

func _on_Play_pressed():
	get_tree().change_scene("res://Dungeon.tscn")
