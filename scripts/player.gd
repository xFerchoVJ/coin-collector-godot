extends CharacterBody2D

# Velocidad a la cual el jugador va a moverse
@export var speed: float = 80
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var is_alive: bool = true

func _physics_process(_delta: float) -> void:
	# Direccion a la cual el jugador esta moviendose
	var direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	# Velocidad de movimiento del jugador
	velocity = direction * speed
	# Aplicar el movimiento
	move_and_slide()
	
	# Aplicar animacion de movimiento
	if direction == Vector2.ZERO:
		animated_sprite_2d.play("idle")
	else:
		animated_sprite_2d.play("walk")
		
	# Voltear el personaje dependiendo hacia donde camine
	if direction.x > 0:
		animated_sprite_2d.flip_h = true
	elif direction.x < 0:
		animated_sprite_2d.flip_h = false
		

func die() -> void:
	# Ya no esta vivo
	is_alive = false
	# Poner la animacion die
	animated_sprite_2d.play("die")
	# Detener input para que deje de moverse
	set_physics_process(false)
