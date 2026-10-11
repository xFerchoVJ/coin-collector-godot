# Plan de desarrollo — Coin Collector

## Concepto
Un juego 2D top-down de exploración. El jugador recorre una habitación, recoge monedas, evita enemigos que patrullan y busca la salida.

- Motor: Godot 4.7.2, GDScript tipado.
- Arte: pack pixel-art de 8x8 px en `Assets/`.

## Alcance del MVP
**Una sola habitación completa**, con:
- Un jugador que se mueve en 4 u 8 direcciones y tiene animaciones idle y walk.
- Una habitación con paredes sólidas, hecha con `TileMapLayer`.
- N monedas recogibles y un contador en pantalla.
- 1 o 2 enemigos que patrullan. Tocarlos significa derrota.
- Una salida que se activa al recoger todas las monedas.
- Pantallas de victoria y derrota, con reinicio, y un menú principal básico.

## Core gameplay loop
Explorar → recoger monedas → esquivar enemigos → la salida se abre → llegar a la salida y ganar (o perder y reiniciar).

## Fases (milestones en Linear)
| Fase | Objetivo | Conceptos de Godot que aprenderé |
|---|---|---|
| **M0 — Preparación** | Repo y proyecto listos para pixel art | Git con Godot, ajustes de proyecto (resolución, stretch, filtro Nearest), sistema de archivos y `res://`, importación de assets |
| **M1 — Jugador** | Un personaje que se mueve y se anima | Escenas y nodos, `CharacterBody2D`, `CollisionShape2D`, Input Map, `_physics_process`, `move_and_slide`, `AnimatedSprite2D` y `SpriteFrames`, GDScript tipado |
| **M2 — Habitación** | Un nivel con paredes sólidas | `TileSet`, `TileMapLayer`, capas de física, collision layers y masks, `Camera2D`, instanciar escenas |
| **M3 — Monedas y HUD** | Coleccionables con un contador | `Area2D`, señales, grupos, `queue_free`, `CanvasLayer`, `Label`, señales personalizadas |
| **M4 — Enemigos** | Peligro y condición de derrota | Patrulla (`@export`, `Marker2D` o `Tween`), detección de contacto, estados simples |
| **M5 — Bucle de juego** | Un juego jugable de principio a fin | Gestión de estado del nivel, `change_scene_to_file`, `reload_current_scene`, nodos `Control` y botones, flujo entre escenas, exportación (opcional) |

## Dependencias entre funcionalidades
```
M0 → M1 → M2 → M3 ─┐
              └→ M4 ─┴→ M5
```
- M3 y M4 son independientes entre sí, pero ambas necesitan al jugador (M1) y a la habitación (M2).
- La salida (M5) necesita el contador de monedas (M3).
- Las pantallas de victoria y derrota necesitan la salida (M5) y los enemigos (M4).

## Definición de terminado del MVP
- [ ] Puedo mover al jugador con animaciones, y no atraviesa las paredes.
- [ ] Puedo recoger todas las monedas y el HUD muestra el progreso.
- [ ] Al menos un enemigo patrulla, y tocarlo me hace perder.
- [ ] La salida se abre al recoger todas las monedas, y llegar a ella me hace ganar.
- [ ] Puedo reiniciar tras ganar o perder, y existe un menú principal que inicia el juego.
- [ ] El juego se ejecuta de principio a fin sin errores en la consola de Godot.
- [ ] El código usa GDScript tipado, y `LEARNING_PROGRESS.md` está al día.
- [ ] Puedo explicar con mis palabras qué es una escena, un nodo y una señal.

## Fuera de alcance del MVP
Para evitar el scope creep, quedan excluidos de este MVP:
- Combate o ataques del jugador.
- Sistema de vida, corazones e invencibilidad.
- Varias habitaciones o transiciones entre salas.
- Llave, cofres, puertas cerradas y gemas.
- Inventario.
- Guardado y carga de partida.
- Generación procedural.
- Sonido y música.
- Arte propio.
- Shaders y partículas.
- Multijugador.
- IA de enemigos con persecución o pathfinding.
- Ajustes, configuración y soporte de mando.

## Ideas post-MVP
Una lista corta para después, sin planificarla ahora:
- Corazones y vida, con invencibilidad temporal al recibir daño.
- Varias habitaciones conectadas.
- Llave y cofre (los assets ya existen).
- Gemas como puntos extra.
- Sonido y música.
