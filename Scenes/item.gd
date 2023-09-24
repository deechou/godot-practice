extends Area2D

var rotation_speed: int = 3
var type_weights = [5,2,1]
var type_options = []
var type = 'blank'

var direction: Vector2
var distance: int = randi_range(150, 250)

func _ready():
	for n in type_weights[0]:
		type_options.append('laser')
	for n in type_weights[1]:
		type_options.append('grenade')
	for n in type_weights[2]:
		type_options.append('health')
	type = type_options[randi() % type_options.size()]
	print(type)

	if(type == 'laser'):
		$Sprite2D.modulate = Color(0.1,0.1,0.5)
	if(type == 'grenade'):
		$Sprite2D.modulate = Color(0.5,0.1,0.2)
	if(type == 'health'):
		$Sprite2D.modulate = Color(0,0.8,0.2)
		
	#tween
	var target_pos = position + direction * distance
	var movement_tween = create_tween()
	movement_tween.tween_property(self, "position", target_pos, 0.5)
	
func _process(delta):
	rotation += rotation_speed * delta


func _on_body_entered(_body):
	if type == 'laser':
		Globals.laser_amount += 10
	if type == 'grenade':
		Globals.grenade_amount += 3
	if type == 'health':
		Globals.health += 10
	queue_free()
