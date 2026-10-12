extends Node2D

var collected_coins: int = 0
var total_coins: int = 0

@onready var hud: CanvasLayer = $HUD

func _ready() -> void:
	# Obtener las monedas de la escena Level
	var coins_in_scene: Array[Node] = get_tree().get_nodes_in_group("coins")
	# De todas las escenas conectar la señal
	for coin in coins_in_scene:
		coin.coin_collected.connect(_on_coin_collected)
	
	# Obtener el total de coins en la escena en número	
	total_coins = coins_in_scene.size()
	#Actualizar el HUD
	hud.update_counter(0, total_coins)
		

func _on_coin_collected() -> void:
	# Cuando se agarra una coin se suma 1 al la variable y actualizamos el hud
	collected_coins += 1
	hud.update_counter(collected_coins, total_coins)
	
