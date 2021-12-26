extends RichTextLabel

func _ready():
	get_parent().load_score()
	text = "Highscore: " + str(Globals.highscore) + "\n Last Score: " + str(Globals.lastscore)
