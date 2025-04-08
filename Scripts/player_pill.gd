extends CharacterBody2D

#signal bullet(pos, rot)
@onready var Game_over : PackedScene = load("res://Scenes/game_over.tscn")
var health = 4
@onready var joystick = $"../JoyStick"

func _ready() -> void:
	$Hurt.visible = false

func _process(_delta: float) -> void:
	var direction = Input.get_vector("LEFT","RIGHT","UP","DOWN")
	velocity = direction * 300
	#if Input.is_action_just_pressed("SHOOT"):
		#bullet.emit($"Player GUN/BULLET OCCUR".global_position)
	move_and_slide()
	
func _physics_process(_delta: float) -> void:
	var direction = joystick.posVector
	if direction:
		velocity = direction * 300
	else:
		velocity = Vector2(0,0)
	move_and_slide()


func _on_health_area_entered(area: Area2D) -> void:
	$"Hurt SOUND".play()
	area.queue_free()
	$Hurt.visible = true
	await get_tree().create_timer(0.3).timeout
	$Hurt.visible = false
	health -= 1
	#print(health)
	get_tree().call_group("ui","set_health",health)
	if health <= 0:
		print("Death")
		get_tree().change_scene_to_packed(Game_over)
		
