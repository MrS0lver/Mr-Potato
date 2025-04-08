extends Node2D

var bullet_scene : PackedScene = load("res://Scenes/bullet.tscn")

func _process(_delta):
	if !Settings.is_mobile:
		var mouse_pos = get_global_mouse_position()
		look_at(mouse_pos)
		var direction = mouse_pos.x - global_position.x
		if direction < 0:
			scale.y = -1  
		else:
			scale.y = 1  
	if Input.is_action_just_pressed("SHOOT") and !Settings.is_mobile:
		$"../GUN SHOOT".play()
		var bullet_shot = bullet_scene.instantiate()
		get_tree().root.add_child(bullet_shot)
		$"BULLET OCCUR/Shoot Animation".play("default")
		bullet_shot.global_position = $"BULLET OCCUR".global_position
		bullet_shot.rotation = rotation
		
	#var mouse_pos = get_global_mouse_position()
	#look_at(mouse_pos)
	#var direction = mouse_pos.x - global_position.x
	#if direction < 0:
		#scale.y = -1  
	#else:
		#scale.y = 1  
	#if Input.is_action_just_pressed("SHOOT"):
		#$"../GUN SHOOT".play()
		#var bullet_shot = bullet_scene.instantiate()
		#get_tree().root.add_child(bullet_shot)
		#$"BULLET OCCUR/Shoot Animation".play("default")
		#bullet_shot.global_position = $"BULLET OCCUR".global_position
		#bullet_shot.rotation = rotation
		#
	
#func  _unhandled_input(event: InputEvent) -> void:
	#if event is InputEventScreenTouch:
		#var looking_at = get_viewport().get_camera_2d().screen_to_world(event.position)
		#look_at(looking_at)
		#if event.is_pressed():
			#var bullet_shot = bullet_scene.instantiate()
			#get_tree().root.add_child(bullet_shot)
			#$"BULLET OCCUR/Shoot Animation".play("default")
			#bullet_shot.global_position = $"BULLET OCCUR".global_position
			#bullet_shot.rotation = rotation
