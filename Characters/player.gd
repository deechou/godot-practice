extends CharacterBody2D

@export var speed: int = 500
var can_laser: bool = true
var can_grenade: bool = true

signal laser_fired(position, player_direction)
signal grenade_fired(position, player_direction)

func _process(_delta):
	
	# input
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	
	# rotate
	look_at(get_global_mouse_position())
	var player_direction = (get_global_mouse_position() - position).normalized()
	
	if Input.is_action_just_pressed("primary action") and can_laser and Globals.laser_amount > 0:
		can_laser = false
		Globals.laser_amount -= 1
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		$LaserCD.start()
		laser_fired.emit(selected_laser.global_position, player_direction)
		
	if Input.is_action_just_pressed("secondary action") and can_grenade and Globals.grenade_amount > 0:
		can_grenade = false
		Globals.grenade_amount -= 1
		$GrenadeCD.start()
		grenade_fired.emit($LaserStartPositions/Middle.global_position, player_direction)
		
	

func _on_laser_cd_timeout():
	can_laser = true

func _on_grenade_cd_timeout():
	can_grenade = true
	

