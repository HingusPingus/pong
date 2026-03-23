extends Control

func _on_btn_ia_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/pong_ia.tscn")

func _on_btn_2_player_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/pong_2_player.tscn")


func _on_btn_quit_pressed() -> void:
	get_tree().quit()


func _on_btn_musica_pressed() -> void:
	if Musica.playing:
		Musica.stop()
		$Panel/btnMusica.text = "Música: OFF"
	else:
		Musica.play()
		$Panel/btnMusica.text = "Música: ON"
