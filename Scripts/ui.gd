extends CanvasLayer

static var image = load("res://Health/LIFE.png")
var time_elapse := 0

func set_health(amount):
	print(amount)
	for child in $MarginContainer/HBoxContainer.get_children():
		child.queue_free()
	for i in amount:
		var text_rect = TextureRect.new()
		text_rect.texture = image
		$MarginContainer/HBoxContainer.add_child(text_rect)
		


func _on_timer_timeout() -> void:
	time_elapse += 1
	$MarginContainer2/Label.text = str("Score: ",time_elapse)
	Global.score = time_elapse
	
