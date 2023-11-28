extends Control

@onready var final_score: Label = $CanvasLayer/MarginContainer/VBoxContainer/FinalScore
# Called when the node enters the scene tree for the first time.
func _ready():
	final_score.text = "FINAL SCORE: " + str(Globals.num_cats)

func _on_home_pressed():
	Globals.num_cats = 1
	Globals.lives = 3
	get_tree().change_scene_to_file("res://MainMenu.tscn")
