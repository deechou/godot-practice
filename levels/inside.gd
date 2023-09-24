extends GenericLevelParent

func _on_exit_area_body_entered(_body):
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0, 1)
	TransitionLayer.change_scene("res://levels/overworld.tscn")
