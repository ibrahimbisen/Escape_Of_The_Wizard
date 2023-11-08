extends Node

var max_lives = 10
var lives = max_lives
var hud
var current_scene

# Global lose heart function and load HUD to show this change
func lose_heart():
	lives -= 1
	hud.load_hearts()
	
	if lives <= 0:
		return get_tree().change_scene("res://Main Scenes/GameOver.tscn")

func heal():
	if lives != max_lives and lives > 0:
		lives += 1
		hud.load_hearts()
