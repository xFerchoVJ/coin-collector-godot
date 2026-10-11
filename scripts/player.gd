extends CharacterBody2D

# Velocidad a la cual el jugador va a moverse
@export var speed: float = 80

func _physics_process(_delta: float) -> void:
	# Direccion a la cual el jugador esta moviendose
	var direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	# Velocidad de movimiento del jugador
	velocity = direction * speed
	# Aplicar el movimiento
	move_and_slide()
