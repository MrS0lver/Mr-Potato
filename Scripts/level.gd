extends Node2D


var speed : int
var rotation_speed : float
var meteor_scene : PackedScene = load("res://Scenes/meteor.tscn")



func _ready() -> void:
	$JoyStick.visible = false
	$BG.stream.loop = true 
	if Settings.is_mobile:
		#$JoyStick.visible = true
		get_tree().change_scene_to_file("res://Scenes/Shoot_button.tscn")
			
		

func _on_timer_timeout() -> void:
	var meteor = meteor_scene.instantiate()
	$Meteor.add_child(meteor)
	
