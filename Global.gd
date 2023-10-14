extends Node

var max_lives = 5
var lives = max_lives
var hud

# Global lose heart function and load HUD to show this change
func lose_heart():
	lives -= 1
	hud.load_hearts()
	#get_tree().change_scene()
