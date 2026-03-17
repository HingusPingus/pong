extends CharacterBody2D

var screen_size:Vector2
const velocidad_inicial:float=650.0
var velocidad:float=velocidad_inicial
var direccion:Vector2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size=get_viewport_rect().size
	print(screen_size)
	position=Vector2(screen_size.x/2, screen_size.y/2)
	direccion=get_direccion_random()
	
func _physics_process(delta: float) -> void:
	var colision=move_and_collide(direccion* velocidad* delta)
	if colision:
		var que_golpee=colision.get_collider_id()
		print(que_golpee)
		
			
		
		direccion=direccion.bounce(colision.get_normal())

func get_direccion_random() -> Vector2:
	var nuevaDireccion=Vector2()
	nuevaDireccion.x=1
	nuevaDireccion.y=randf_range(-1,1)
	return nuevaDireccion.normalized()
