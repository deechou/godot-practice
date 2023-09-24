extends GenericLevelParent

func _on_gate_area_entered(_body):
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0, 1)
	TransitionLayer.change_scene("res://levels/inside_building.tscn")

func _on_house_player_entered():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/PlayerCam, "zoom", Vector2(1,1,), 1)

func _on_house_player_exited():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/PlayerCam, "zoom", Vector2(0.6, 0.6), 1)
