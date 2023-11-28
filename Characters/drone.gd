extends CharacterBody2D

@onready var animations = $AnimationPlayer
var rng = RandomNumberGenerator.new()
var current_speed: int = 100
var direction = Vector2.LEFT
var stamina = 100
@onready var dash_sound = $DashSound
@onready var meow_sound = $MeowSound
@onready var escape_sound = $EscapeSound



func _ready():
	if(rng.randf_range(0,1) >= 0.5):
		$Sprite2D.texture = load("res://Characters/SideWalk_Orange.png")
	change_direction()
	$Zoomies.wait_time = rng.randi_range(1,10)
	$Zoomies.start()
	animations.play("Walk")
	$AnimationPlayer.speed_scale = 1

func _process(_delta):
	# velocity
	velocity = direction * current_speed
	
	# move and slide
	move_and_slide()

func change_speed():
	var rand = rng.randf_range(0.01,5)
	current_speed = current_speed * rand
	$AnimationPlayer.speed_scale = rand

func change_direction():
	direction = Vector2(rng.randf_range(-1,1), rng.randf_range(-1,1))
	#direction = Vector2.LEFT
	
	if(direction.x < 0):
		$Sprite2D.flip_h = true
	else:
		$Sprite2D.flip_h = false
		
	#if(direction.y > 0):
	#	$Sprite2D.rotate(90)

func hit():
	#print("Yum!")
	stamina += 50
	$Node2D/HealthBar.value = stamina
	meow_sound.pitch_scale = rng.randf_range(0.9,1.1)
	meow_sound.play()
	


func _on_zoomies_timeout():
	dash_sound.play()
	change_speed()
	change_direction()
	$Zoomies.stop()
	$ZoomDuration.start()
	#print("zoomies started! current speed: " + str(current_speed))
	


func _on_zoom_duration_timeout():
	$ZoomDuration.stop()
	$ZoomDuration.wait_time = 2
	current_speed = 100
	$AnimationPlayer.speed_scale = 1
	$Zoomies.wait_time = rng.randi_range(1,10)
	$Zoomies.start()
	#print("zoomies ended! current speed: " + str(current_speed))
	


func _on_hunger_timeout():
	stamina = stamina - 10
	$Node2D/HealthBar.value = stamina
	if(stamina < 0):
		Globals.num_cats -= 1
		Globals.lives -= 1
		escape_sound.play()
		await escape_sound.finished
		queue_free()		
		if(Globals.lives <= 0):
			get_tree().change_scene_to_file("res://GameOver.tscn")
	#print(stamina)


func _on_area_2d_body_entered(_body):
	print("Collision")
	change_direction()
	change_speed()
