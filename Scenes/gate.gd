extends StaticBody2D

signal area_entered(body)

func _on_area_2d_body_entered(body):
	print("Player entered area")
	area_entered.emit(body)
	print(body)
