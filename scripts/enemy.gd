extends CharacterBody2D

signal player_touched

@export var speed: float = 80
@export var distance: float = 80
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var start_position: Vector2
var direction: float = -1

func _ready() -> void:
	# Guardar la posición global del enemigo
	start_position = global_position
	
func _physics_process(_delta: float) -> void:
	# Moverlo
	velocity.x = speed * direction
	move_and_slide()
	
	# Calcular la distancia recorrida del inicio a donde esta ahorita
	var distance_traveled: float = global_position.x - start_position.x
	
	# Validar si se alejo mas de distance para cambiar la direccion
	if absf(distance_traveled) >= distance:
		direction = direction * -1
		
	# Voltear sprite dependiendo la direction
	animated_sprite_2d.flip_h = direction > 0
		
	# Poner animacion de caminar
	if velocity != Vector2.ZERO:
		animated_sprite_2d.play("walk")
	else:
		animated_sprite_2d.play("idle")
		

func _on_hit_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_touched.emit()
