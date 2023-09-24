class_name GenericLevelParent
extends Node2D

var laser_scene: PackedScene = preload("res://Projectiles/Laser.tscn")
var grenade_scene: PackedScene = preload("res://Projectiles/Grenade.tscn")
var item_scene: PackedScene = preload("res://Scenes/item.tscn")

func _ready():
	for container in get_tree().get_nodes_in_group('Container'):
		print(container)
		container.connect("opened", _on_container_opened)

func _on_player_grenade_fired(pos, direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)
	$UI.update_grenade_text()
	

func _on_player_laser_fired(pos, direction):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	laser.direction = direction
	$Projectiles.add_child(laser)
	$UI.update_laser_text()

func _on_container_opened(pos, direction):
	var item = item_scene.instantiate()
	item.position = pos
	item.direction = direction
	$Items.call_deferred("add_child", item)
