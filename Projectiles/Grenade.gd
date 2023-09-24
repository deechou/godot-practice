extends RigidBody2D

@export var speed: int = 1000

func explode():
	print("explode")
	$AnimationPlayer.play("Explosion")
	$CollisionShape2D.disabled = true
	
