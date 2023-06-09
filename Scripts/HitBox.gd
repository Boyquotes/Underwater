extends Area2D
@onready var player = $".."
@onready var main_scene = $"res://Scenes/main.tscn"
@onready var died_scene = $"res://Scenes/died.tscn"

func _on_body_entered(body):
	if body is Enemy:
		player.hp -= 100

func _process(delta):
	if player.hp == 0 or player.h2o == 0:
		player.visible = false
		get_tree().change_scene_to_file("res://Scenes/died.tscn")
