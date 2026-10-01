extends Area2D

func _ready() -> void:
	$AnimatedSprite2D.play("idle")

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Jugador"):
		$AnimatedSprite2D.play("die")
