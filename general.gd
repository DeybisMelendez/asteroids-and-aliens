extends Node

var score = 0
var maxScore = 0
var skinNave = 1
var skinLaser = 1

var path = "user://save_game.save"

func _ready():
	cargarJuego()

func guardarJuego():
	var file = File.new()
	file.open(path, file.WRITE)
	file.store_var(maxScore)
	file.store_var(skinNave)
	file.store_var(skinLaser)
	file.store_var(global.bg)
	file.close()

func cargarJuego():
	var file = File.new()
	if not file.file_exists(path):
		return
	file.open(path, file.READ)
	maxScore = file.get_var()
	skinNave = file.get_var()
	skinLaser = file.get_var()
	global.bg = file.get_var()
	file.close()
