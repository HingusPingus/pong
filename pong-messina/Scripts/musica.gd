extends AudioStreamPlayer

func _ready() -> void:
	stream = load("res://assets/pong.mp3")
	stream.loop = true
	play()
