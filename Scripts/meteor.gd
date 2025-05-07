extends Area2D
var speed : int
var rotation_speed : float
var direction_x : int


func _ready() -> void:
	var rand = RandomNumberGenerator.new()
	var path : String = "res://Meteors/Meteor ("+ str(rand.randi_range(1,14)) +").png"
	$"Meteor IMG".texture = load(path) 
	var width = get_viewport().get_visible_rect().size[0] #Getting the  display size dynamically
	var random_x = rand.randi_range(0,width)
	var random_y = rand.randi_range(-150,-50)
	position = Vector2(random_x,random_y)
	speed = rand.randi_range(200,400)
	rotation_speed = rand.randi_range(1,5)
	direction_x = rand.randi_range(-1,1)
	
func _process(delta: float) -> void:
	rotation += rotation_speed * delta
	position += Vector2(direction_x,1.0) * speed * delta

func _on_area_entered(area: Area2D) -> void:
	area.queue_free()
	queue_free()


#WE have to set them in different layers
