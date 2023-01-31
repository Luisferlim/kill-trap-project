extends KinematicBody2D

const ACCELERATION = 50
const MAX_SPEED = 400
const FRICTION = 300

var velocity = Vector2.ZERO
onready var animsprite = $AnimatedSprite

func _ready():
	animsprite.playing = true

#movimentação base do player
func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity += input_vector * ACCELERATION * delta
		velocity = velocity.limit_length(MAX_SPEED * delta)
		animsprite.play("run")
	else:
		#velocity = Vector2.ZERO
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		animsprite.play("idle")
	
	update_rotation(velocity)
# warning-ignore:return_value_discarded
	move_and_collide(velocity)

func update_rotation(direction):
	animsprite.flip_h = direction.x < 0
