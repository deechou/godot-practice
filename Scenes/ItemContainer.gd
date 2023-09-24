extends StaticBody2D
class_name ItemContainer

@onready var current_direction: Vector2 = Vector2.DOWN.rotated(self.get_global_transform().get_rotation())
var already_opened: bool = false

signal opened(pos, direction)

func hit():
	print("object")
