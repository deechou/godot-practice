extends GenericLevelParent

var cat_scene: PackedScene = preload("res://Scenes/drone.tscn")
@onready var spawn_pos = $SpawnPoint.position

func _ready():
	print($SpawnPoint.position)
	

func _on_gate_area_entered(_body):
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0, 1)
	TransitionLayer.change_scene("res://levels/inside_building.tscn")

func _on_house_player_entered():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/PlayerCam, "zoom", Vector2(1,1,), 1)

func _on_house_player_exited():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/PlayerCam, "zoom", Vector2(0.6, 0.6), 1)


func _on_cat_spawn_timeout():
	var cat = cat_scene.instantiate() as CharacterBody2D
	var cat_markers = $SpawnPoint.get_children()
	var selected_marker = cat_markers[randi() % cat_markers.size()]
	cat.position = selected_marker.global_position
	$Cats.add_child(cat)
	Globals.num_cats += 1
	$CatSpawn.wait_time = 15
	$CatSpawn.start()
