extends KinematicBody2D
class_name Character

#declaracao de variaveis
const friction: float = 0.15

export(int) var acceleration: int = 40
export(int) var max_speed: int = 100

var mov_dir: Vector2 = Vector2.ZERO
var velocity: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	velocity = move_and_slide(velocity) #padrao para movimentacao
	velocity = lerp(velocity, Vector2.ZERO, friction) #desacelerar ateh ficar na velocidade zero com a aceleração de fiction

func move() -> void:
	
	mov_dir = mov_dir.normalized() #normaliza o tamnanho do vetor
	velocity += mov
