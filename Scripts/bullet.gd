
extends Area2D

@export var speed : float = 500.0  # Bullet speed

func _process(delta):
	position += transform.x * speed * delta  
	
	
