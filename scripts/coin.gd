extends Area2D

# Declaramos la señal que el HUD va a escuchar
signal coin_collected

func _on_body_entered(body: Node2D) -> void:
	# Verificamos si el cuerpo que entró es el jugador
	if body.is_in_group("player"):
		# Emitimos nuestra señal personalizada
		coin_collected.emit()
		# Eliminar moneda del mapa
		queue_free()
