extends Node

var max_lives = 5
var lives = max_lives
var hud

func lose_heart():
	lives -= 1
	hud.load_hearts()
