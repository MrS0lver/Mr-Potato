extends Control

func _ready() -> void:
	$"Game Over".play()
	$CenterContainer/VBoxContainer/Label2.text = str("Score : ",Global.score)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("START AGAIN"):
		get_tree().change_scene_to_file("res://Scenes/level.tscn")
