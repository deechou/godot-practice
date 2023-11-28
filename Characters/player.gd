extends CharacterBody2D

@export var speed: int = 500
var can_laser: bool = true
var can_grenade: bool = false

signal laser_fired(position, player_direction)
signal grenade_fired(position, player_direction)
@onready var throw_sound = $ThrowSound

func _process(_delta):
	
	# input
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	
	if(velocity != Vector2.ZERO):
		$AnimationTree.set("active", true)
		
		$AnimationTree.get("parameters/playback").travel("Walk")
		$AnimationTree.set("parameters/Walk/blend_position", velocity)	
		move_and_slide()
	else:
		$AnimationTree.set("active", false)
	
	# rotate
	#look_at(get_global_mouse_position())
	var player_direction = (get_global_mouse_position() - position).normalized()
	
	if Input.is_action_just_pressed("primary action") and can_laser and Globals.laser_amount > 0:
		can_laser = false
		Globals.laser_amount -= 1
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		$LaserCD.start()
		laser_fired.emit(selected_laser.global_position, player_direction)
		throw_sound.play()
		
	if Input.is_action_just_pressed("secondary action") and can_grenade and Globals.grenade_amount > 0:
		can_grenade = false
		Globals.grenade_amount -= 1
		$GrenadeCD.start()
		grenade_fired.emit($LaserStartPositions/Middle.global_position, player_direction)
		
	

func _on_laser_cd_timeout():
	can_laser = true

func _on_grenade_cd_timeout():
	can_grenade = true
	

