extends ItemContainer

func hit():
	if !already_opened:
		$LidSprite.hide()
		for i in range(5):
			opened.emit(($SpawnPositions.get_children().pick_random()).global_position, current_direction)
		already_opened = true
