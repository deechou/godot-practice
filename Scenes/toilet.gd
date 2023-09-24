extends ItemContainer

func hit():
	if !already_opened:
		$LidSprite.hide()
		opened.emit($SpawnPositions/Marker2D.global_position, current_direction)
		already_opened = true

