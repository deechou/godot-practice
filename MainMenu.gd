extends Control
var game_scene: PackedScene = preload("res://levels/overworld.tscn")
var info_scene: PackedScene = preload("res://Info.tscn")

@onready var menu_sound = $MenuSound

func _on_start_button_pressed():
	menu_sound.play()
	await menu_sound.finished
	get_tree().change_scene_to_packed(game_scene)


func _on_quit_button_pressed():
	menu_sound.play()
	await menu_sound.finished
	get_tree().quit()


func _on_instruction_button_pressed():
	menu_sound.play()
	await menu_sound.finished
	get_tree().change_scene_to_packed(info_scene)
