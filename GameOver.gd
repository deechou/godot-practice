extends Control

@onready var final_score: Label = $CanvasLayer/MarginContainer/VBoxContainer/FinalScore
var main_screen: PackedScene = preload("res://MainMenu.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	final_score.text = "FINAL SCORE: " + str(Globals.num_cats)

func _on_home_pressed():
	$MenuSounds.play()
	await $MenuSounds.finished
	Globals.num_cats = 1
	Globals.lives = 3
	get_tree().change_scene_to_packed(main_screen)
