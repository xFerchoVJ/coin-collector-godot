extends Area2D

signal player_entered

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_entered.emit()


func open() -> void:
	# Activar animacion de abrir
	animated_sprite_2d.play("open")
	# Hacer que el area detecte al jugador
	set_deferred("monitoring", true)
