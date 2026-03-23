extends Node2D
 
var puntaje:= [0,0]
const velocidadBarras:int=500
 
 
func _ready() -> void:
	$MenuPausa.hide()
 
 
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		if get_tree().paused:
			reanudar()
		else:
			pausar()
 
 
func pausar() -> void:
	get_tree().paused = true
	$MenuPausa.show()
 
 
func reanudar() -> void:
	get_tree().paused = false
	$MenuPausa.hide()
 
 
func _on_timer_timeout() -> void:
	$Pelota.nueva()
 
 
func _on_pared_derecha_body_entered(_body: Node2D) -> void:
	puntaje[0]+=1
	$hud/puntajeI.text=str(puntaje[0])
	$Timer.start()
 
func _on_pared_izquierda_body_entered(_body: Node2D) -> void:
	puntaje[1]+=1
	$hud/puntajeD.text=str(puntaje[1])
	$Timer.start()

func _on_reanudar_pressed() -> void:
	reanudar()


func _on_menu_principal_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
