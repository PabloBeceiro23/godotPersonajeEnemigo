extends Area2D

var dando_puñetazo = false 

func _ready() -> void:
	$AnimatedSprite2D.play("idle")

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Personaje":
		$AnimatedSprite2D.play("die")

func _on_animated_sprite_2d_frame_changed() -> void:
	if $AnimatedSprite2D.animation == "punch":
		
		if $AnimatedSprite2D.frame in [5,6,7,8,9]:
			dando_puñetazo = true
