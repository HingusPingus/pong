extends CharacterBody2D
@export var speed:float= 30000
@export var up=""
@export var down=""
var alturaVentana:int
var alturaBarra:int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	alturaVentana=get_viewport_rect().size.y
	alturaBarra=$ColorRect.size.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	var direccion=Vector2.ZERO
	if Input.is_action_pressed(up):
		direccion.y+=-1
	if Input.is_action_pressed(down):
		direccion.y+=1
	velocity=direccion*speed*delta
	move_and_slide()
		
