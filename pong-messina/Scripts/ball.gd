extends CharacterBody2D

var screen_size:Vector2
const velocidad_inicial:int=500
var velocidad:int 
var aceleracion:int=50
var direccion:Vector2
const vectorYMaximo:float=0.6

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size=get_viewport_rect().size
	
func nueva() -> void:
		position=Vector2(screen_size.x/2, screen_size.y/2)
		direccion=get_direccion_random()
		velocidad=velocidad_inicial
	
func _physics_process(delta: float) -> void:
	var colision=move_and_collide(direccion* velocidad* delta)
	var colisionador
	if colision:
		colisionador=colision.get_collider()
		if colisionador==$"../BarraIzquierda" or colisionador==$"../BarraDerecha":
			velocidad+=aceleracion
			direccion=nuevaDir(colisionador)
			$"../rebote".play()
		else:
			direccion=direccion.bounce(colision.get_normal())
			$"../rebote".play()
		
		

func get_direccion_random() -> Vector2:
	var nuevaDireccion=Vector2()
	nuevaDireccion.x=1
	nuevaDireccion.y=randf_range(-1,1)
	return nuevaDireccion.normalized()
	
func nuevaDir(colisionador) -> Vector2:
	var posicionPelota=position.y
	var posicionBarraD=colisionador.position.y
	var distancia=posicionPelota-posicionBarraD
	var dir:=Vector2()
	if direccion.x>0:
		dir.x=-1
	else:
		dir.x=1
	dir.y=(distancia/(colisionador.alturaBarra/2))*vectorYMaximo
	return dir.normalized()
