extends Node2D

var collected_coins: int = 0
var total_coins: int = 0
var player_win: bool = false

@onready var hud: CanvasLayer = $HUD
@onready var player: CharacterBody2D = $Player
@onready var exit: Area2D = $Exit
@onready var end_screen: CanvasLayer = $EndScreen

func _ready() -> void:
	# Obtener las monedas de la escena Level
	var coins_in_scene: Array[Node] = get_tree().get_nodes_in_group("coins")
	var enemies_in_scene: Array[Node] = get_tree().get_nodes_in_group("enemies")
	
	# Conectar señales de las escenas
	for coin in coins_in_scene:
		coin.coin_collected.connect(_on_coin_collected)
		
	for enemy in enemies_in_scene:
		enemy.player_touched.connect(_on_kill_player)
	
	exit.player_entered.connect(_on_player_entered_exit)
	end_screen.button_pressed.connect(_on_player_pressed_button)
	
	# Obtener el total de coins en la escena en número	
	total_coins = coins_in_scene.size()
	#Actualizar el HUD
	hud.update_counter(0, total_coins)

func _on_coin_collected() -> void:
	# Cuando se agarra una coin se suma 1 al la variable y actualizamos el hud
	collected_coins += 1
	hud.update_counter(collected_coins, total_coins)
	if collected_coins >= total_coins:
		exit.open()
		
	
func _on_kill_player() -> void:
	if not player.is_alive:
		return

	if player_win:
		return

	player.die()
	end_screen.update_label("Perdiste")
	
func _on_player_entered_exit() -> void:
	if not player.is_alive:
		return
	player_win = true
	end_screen.update_label("Ganaste!")
	
func _on_player_pressed_button() -> void:
	get_tree().reload_current_scene()
