extends CharacterBody2D
var alturaVentana:int
var alturaBarra:int
var posicionPelota:Vector2
var distancia:int
var moverse:int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	alturaVentana=get_viewport_rect().size.y
	alturaBarra=$ColorRect.size.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	posicionPelota=$"../Pelota".position
	distancia=position.y-posicionPelota.y
	if abs(distancia)>get_parent().velocidadBarras*delta:
		moverse=get_parent().velocidadBarras*delta*(distancia/abs(distancia))
	else:
		moverse=distancia
	position.y-=moverse
	
	position.y = clamp(position.y, alturaBarra / 2.0, alturaVentana - alturaBarra / 2.0)
