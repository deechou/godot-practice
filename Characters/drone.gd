extends CharacterBody2D


func _process(_delta):
	
	var speed: int = 100
	# direction
	var direction = Vector2.RIGHT

	# velocity
	velocity = direction * speed
	# move and slide
	move_and_slide()


func hit():
	print("Ouch!")
