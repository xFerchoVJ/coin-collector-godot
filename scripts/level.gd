extends Node2D

var collected_coins: int = 0
var total_coins: int = 0

@onready var hud: CanvasLayer = $HUD
@onready var player: CharacterBody2D = $Player

func _ready() -> void:
	# Obtener las monedas de la escena Level
	var coins_in_scene: Array[Node] = get_tree().get_nodes_in_group("coins")
	var enemies_in_scene: Array[Node] = get_tree().get_nodes_in_group("enemies")
	# De todas las coins conectar la señal
	for coin in coins_in_scene:
		coin.coin_collected.connect(_on_coin_collected)
		
	for enemy in enemies_in_scene:
		enemy.player_touched.connect(_on_kill_player)
	
	# Obtener el total de coins en la escena en número	
	total_coins = coins_in_scene.size()
	#Actualizar el HUD
	hud.update_counter(0, total_coins)
		

func _on_coin_collected() -> void:
	# Cuando se agarra una coin se suma 1 al la variable y actualizamos el hud
	collected_coins += 1
	hud.update_counter(collected_coins, total_coins)
	
	
func _on_kill_player() -> void:
	if not player.is_alive:
		return
	player.die()
	print("Juego terminado")
