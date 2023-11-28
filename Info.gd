extends Control

@onready var final_score: Label = $CanvasLayer/MarginContainer/VBoxContainer/FinalScore
# Called when the node enters the scene tree for the first time.

func _on_home_pressed():
	$MenuSounds.play()
	await $MenuSounds.finished
	Globals.num_cats = 1
	Globals.lives = 3
	get_tree().change_scene_to_file("res://MainMenu.tscn")
