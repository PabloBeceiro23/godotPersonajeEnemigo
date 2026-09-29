extends CharacterBody2D


const SPEED = 120.0
var velocidad_actual = SPEED


func _process(delta):
	if velocity.x > 0:
		$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.flip_h = false
	elif velocity.x < 0:
		$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.play("idle")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if  not $RayCastDerecha2D.is_colliding():
		velocidad_actual = -SPEED
		
	if  not $RayCastIzquierda2D.is_colliding():
		velocidad_actual = SPEED
	
	

	velocity.x = velocidad_actual


	move_and_slide()


func _on_area_muerte_enemigo_body_entered(body: Node2D) -> void:
	if body.name == "Personaje":
		body.morir()
