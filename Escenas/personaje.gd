extends CharacterBody2D

@export var Pantalla_Muerte: Control
const SPEED = 300.0
const JUMP_VELOCITY = -420.0
var estasMuerto = false



func _process(delta):
	
	if estasMuerto:
		$AnimatedSprite2D.play("die")
	elif velocity.x > 0:
		$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.flip_h = false
	elif velocity.x < 0:
		$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.play("idle")

func _physics_process(delta: float) -> void:
	
	#gravedad
	if not is_on_floor():
		velocity = velocity + get_gravity() * delta

	if estasMuerto:
		velocity.x = 0
	elif Input.is_action_pressed("izqda"):
		velocity.x = -SPEED
	elif Input.is_action_pressed("der"):
		velocity.x = SPEED
	else:
		velocity.x = 0
# salto
	if is_on_floor() and Input.is_action_just_pressed("space"):
		velocity.y = JUMP_VELOCITY
	
	move_and_slide()
	
func morir():
	estasMuerto = true
	if Pantalla_Muerte:
		Pantalla_Muerte.visible = true
