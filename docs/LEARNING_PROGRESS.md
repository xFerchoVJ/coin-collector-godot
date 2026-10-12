# Progreso de aprendizaje

**Estados:** `Not started` · `In progress` · `Completed` · `Needs revision`

> Una tarea pasa a `Completed` solo cuando yo lo confirmo o cuando verificamos el resultado juntos.

## Resumen
| ID | Tarea | Milestone | Estado | Linear |
|---|---|---|---|---|
| T01 | Inicializar Git y ajustar `.gitignore` | M0 | Completed | XFE-5 |
| T02 | Configurar el proyecto para pixel art y organizar carpetas | M0 | Completed | XFE-6 |
| T03 | Escena Player | M1 | Completed | XFE-7 |
| T04 | Movimiento top-down con Input Map | M1 | Completed | XFE-8 |
| T05 | Animaciones idle y walk | M1 | Completed | XFE-9 |
| T06 | TileSet y pintar la habitación | M2 | Completed | XFE-10 |
| T07 | Colisiones de paredes y collision layers | M2 | Completed | XFE-11 |
| T08 | Escena Level y Camera2D | M2 | Completed | XFE-12 |
| T09 | Escena Coin animada | M3 | Completed | XFE-13 |
| T10 | Recoger una moneda | M3 | Not started | XFE-14 |
| T11 | Contador de monedas y HUD | M3 | Not started | XFE-15 |
| T12 | Escena Enemy animada | M4 | Not started | XFE-16 |
| T13 | Patrulla del enemigo | M4 | Not started | XFE-17 |
| T14 | Contacto con el enemigo y derrota | M4 | Not started | XFE-18 |
| T15 | La salida | M5 | Not started | XFE-19 |
| T16 | Pantallas de victoria y derrota | M5 | Not started | XFE-20 |
| T17 | Menú principal | M5 | Not started | XFE-21 |
| T18 | Revisión final contra la DoD | M5 | Not started | XFE-22 |

## Detalle por tarea
Plantilla (la copio a cada tarea cuando la empiezo):

```
### Txx — Título
- **Estado:** Not started
- **Linear:** XFE-n
- **Fechas:** inicio / fin
- **Qué aprendí:**
- **Qué implementé:**
- **Dificultades:**
- **Notas de revisión:**
```

### T01 — Inicializar Git y ajustar `.gitignore`
- **Estado:** Completed
- **Linear:** XFE-5
- **Fechas:** 2026-10-11 / 2026-10-11
- **Qué aprendí:** `.godot/` es caché regenerable y no se versiona, como `tmp/` en Rails. Los archivos `.import` sí se versionan.
- **Qué implementé:** `git init`, `Thumbs.db` en el `.gitignore` y el primer commit (`86ed279`).
- **Dificultades:** ninguna.
- **Notas de revisión:** verificado juntos con `git log`, `git status` y `git check-ignore`. Hay 21 `.import` versionados. Pendiente opcional: salto de línea final en `.gitignore`.

### T02 — Configurar pixel art y organizar carpetas
- **Estado:** Completed
- **Linear:** XFE-6
- **Fechas:** 2026-10-11 / 2026-10-11
- **Qué aprendí:** el viewport es la resolución lógica del juego y el override de ventana es el tamaño real, son ajustes distintos. El filtro `Nearest` (valor 0) evita que el pixel art se vea borroso. Las carpetas del proyecto van en `snake_case` minúsculas por compatibilidad entre plataformas.
- **Qué implementé:** viewport 320x180, ventana 1280x720 (escala 4x), filtro de texturas Nearest, y carpetas `scenes/`, `scripts/` y `ui/`.
- **Dificultades:** al principio puse 1280x720 en el viewport en vez de en el override, lo que hacía los sprites diminutos. Las carpetas las creé con mayúscula inicial y las renombré.
- **Notas de revisión:** verificado juntos revisando `project.godot`. La escena de prueba se borró, así que T03 empieza desde cero. `scripts/` y `ui/` siguen vacías y Git no las versiona hasta que tengan archivos.

### T03 — Escena Player
- **Estado:** Completed
- **Linear:** XFE-7
- **Fechas:** 2026-10-11 / 2026-10-11
- **Qué aprendí:** una escena es un árbol de nodos reutilizable que se instancia dentro de otras. Un `CharacterBody2D` necesita siempre una forma de colisión. `vframes` y `hframes` dividen una tira de sprites en frames. F6 ejecuta la escena abierta y F5 la principal.
- **Qué implementé:** `scenes/player.tscn` con `CharacterBody2D`, `Sprite2D` (`vframes = 4`, un solo frame visible) y `CollisionShape2D` (rectángulo de 8x7 en `(0, 0.5)`), probada con una escena temporal.
- **Dificultades:** ninguna.
- **Notas de revisión:** verificado juntos. La colisión coincide con los píxeles opacos del frame 0 (8x7). La escena de prueba `test.tscn` se borró después de verificar.

### T04 — Movimiento top-down con Input Map
- **Estado:** Completed
- **Linear:** XFE-8
- **Fechas:** 2026-10-11 / 2026-10-11
- **Qué aprendí:** el Input Map asigna nombres de acción a teclas, y el código pregunta por la acción (como un `routes.rb`). `Input.get_vector()` devuelve un vector ya normalizado, así que la diagonal no es más rápida. `velocity` está en px/s y `move_and_slide()` aplica `delta` internamente. Los parámetros no usados se prefijan con `_`. `physical_keycode` mapea la posición física de la tecla, así que WASD funciona en cualquier distribución.
- **Qué implementé:** `scripts/player.gd` (`CharacterBody2D`, `@export var speed: float = 80`, `Input.get_vector` y `move_and_slide()` en `_physics_process`) y las acciones `move_left`, `move_right`, `move_up` y `move_down` en el Input Map.
- **Dificultades:** al principio usé las acciones `ui_*` en vez de acciones propias, y una velocidad de 200 que era excesiva para un viewport de 320x180. El script quedó primero en `ui/` y lo moví a `scripts/` desde el panel FileSystem de Godot.
- **Notas de revisión:** verificado juntos: movimiento en las cuatro direcciones, diagonal igual de rápida y velocidad de 80 cómoda. El aviso `Case mismatch ... res://Scenes/player.tscn` venía de la caché del editor en `.godot/` (rastro del renombrado de carpetas en T02), no del código.

### T05 — Animaciones idle y walk
- **Estado:** Completed
- **Linear:** XFE-9
- **Fechas:** 2026-10-11 / 2026-10-11
- **Qué aprendí:** `AnimatedSprite2D` reproduce animaciones nombradas guardadas en un recurso `SpriteFrames`. Cada frame de una tira se recorta como `AtlasTexture` con una región (aquí 8x8). `flip_h` espeja el sprite y solo debe cambiarse cuando hay movimiento horizontal, para que el personaje conserve hacia dónde miraba. En Godot 4, `play()` con la animación que ya suena normalmente no la reinicia.
- **Qué implementé:** `AnimatedSprite2D` en `scenes/player.tscn` con las animaciones `idle` y `walk` (4 frames, 8 FPS, bucle) a partir de `Player Idle.png` y `Player Walk.png`. En `scripts/player.gd`, `idle` o `walk` según `direction == Vector2.ZERO` y `flip_h` con `if`/`elif` sin `else`.
- **Dificultades:** primero usé `velocity.x > 0` para `walk`, que solo funcionaba hacia la derecha. El `else` del flip volteaba el sprite al quedarse quieto. El arte es frontal y casi simétrico, así que el flip se nota poco; se dejó puesto por el criterio de aceptación.
- **Notas de revisión:** verificado juntos con F6: `idle` quieto, `walk` en cualquier dirección y el lado se conserva al soltar la tecla y al ir en vertical.

### T06 — TileSet y pintar la habitación
- **Estado:** Completed
- **Linear:** XFE-10
- **Fechas:** 2026-10-11 / 2026-10-11
- **Qué aprendí:** un tile es una pieza reutilizable y un atlas es una imagen con muchos tiles en cuadrícula (aquí 7x4 de 8 px). El `TileSet` es la paleta y el `TileMapLayer` es el nodo donde se pinta. El tamaño de tile debe ser 8x8, no el 16x16 por defecto. El viewport 320x180 equivale a 40x22,5 tiles, así que sobra media fila. Un hueco del mismo ancho que el jugador es demasiado justo; conviene dejar 2 tiles.
- **Qué implementé:** `scenes/level.tscn` con raíz `Node2D` y un `TileMapLayer` llamado `Walls`, con un `TileSet` de tiles 8x8 sobre `Terrain Sheet.png`. Habitación de 40x23 tiles con suelo, paredes, esquinas y dos bloques interiores, y un hueco de 2 tiles (`x = 20..21`) en la pared superior para la salida.
- **Dificultades:** el hueco de la salida tenía 1 tile, igual que el ancho del jugador, y lo amplié a 2. La habitación mide 23 filas (184 px) frente a 180 px de pantalla, así que la última fila se corta unos píxeles; se decidió dejarlo y resolverlo con la `Camera2D` en T08.
- **Notas de revisión:** verificado juntos decodificando las celdas del `.tscn` (perímetro cerrado salvo el hueco) y con F6. Suelo y paredes comparten una sola capa; se decidirá en T07 si se separan o si la colisión va por tile.

### T07 — Colisiones de paredes y collision layers
- **Estado:** Completed
- **Linear:** XFE-11
- **Fechas:** 2026-10-11 / 2026-10-11
- **Qué aprendí:** un `TileSet` necesita una physics layer antes de que sus tiles puedan tener colisión, y cada tile lleva su propio polígono. La *layer* es "en qué capa estoy" y la *mask* es "contra qué capas choco"; se guardan como bits que se suman (`world` = 1, `player` = 2, así que 3 = ambas). Los nombres de layers se definen en Project Settings. *Debug → Visible Collision Shapes* permite ver las colisiones al ejecutar.
- **Qué implementé:** physics layer 0 en el `TileSet` (`collision_layer = 1`, `world`) con un polígono cuadrado de 8x8 en los tiles de pared (columnas 0 a 3 del atlas y el `(1,1)`), sin colisión en suelo ni zonas decorativas. Layers nombradas `world`, `player`, `enemy` y `pickup`. Jugador en la layer `player` y mask solo `world`.
- **Dificultades:** el jugador tenía `collision_mask = 3`, que incluía su propia layer; se corrigió a `1`. Quedó pendiente de decisión de diseño qué zonas interiores son obstáculos: se dejaron como decoración caminable.
- **Notas de revisión:** verificado juntos con F6 en una escena temporal `test.tscn` (borrada después): el jugador choca con paredes, esquinas y pilares, y pasa por el suelo y las zonas sin colisión. Suelo y paredes siguen en una sola capa `Walls`, con colisión solo en los tiles de pared.

### T08 — Escena Level y Camera2D
- **Estado:** Completed
- **Linear:** XFE-12
- **Fechas:** 2026-10-11 / 2026-10-11
- **Qué aprendí:** una escena se instancia dentro de otra y se pueden cambiar propiedades de la instancia, como la posición, sin tocar la escena original. `Camera2D` decide qué parte del mundo se ve, y sus límites (`limit_left`, `limit_top`, `limit_right`, `limit_bottom`) están en píxeles del mundo. El índice del último tile no es el número de tiles: 40 columnas son los índices 0 a 39. `level.tscn` se ejecuta con F5 al fijarlo como escena principal.
- **Qué implementé:** `player.tscn` instanciado en `level.tscn` en `(146, 104)`, `Camera2D` como hija del jugador con límites `0, 0, 320, 184`, y `level.tscn` como escena principal. El `TileMapLayer` se renombró de `Walls` a `Map`.
- **Dificultades:** puse primero los límites `right = 312` y `bottom = 176`, que son los índices de la última columna y fila por 8, en vez de 320 y 184, que son el conteo de tiles por 8.
- **Notas de revisión:** verificado juntos con F5: se ve la habitación entera, las cuatro paredes completas y el jugador se mueve por ella. La cámara va dentro de `player.tscn`, así que los límites viven en la escena del jugador; con un solo nivel es suficiente, con varios habría que ajustarlos en cada uno.

### T09 — Escena Coin animada
- **Estado:** Completed
- **Linear:** XFE-13
- **Fechas:** 2026-10-11 / 2026-10-11
- **Qué aprendí:** un `Area2D` detecta solapamientos pero no bloquea el movimiento, a diferencia de un `StaticBody2D`. Necesita un `CollisionShape2D` hijo para definir su zona. En `AnimatedSprite2D`, el bucle se marca en la animación del `SpriteFrames` y el autoplay se elige en el propio nodo.
- **Qué implementé:** `coin.tscn` con raíz `Area2D`, `AnimatedSprite2D` con 4 frames de `Coin.png` (animación `idle`, 8 FPS, bucle y autoplay) y `CollisionShape2D` rectangular de 6x6. Cuatro instancias en `level.tscn`.
- **Dificultades:** ninguna destacable.
- **Notas de revisión:** verificado juntos: las monedas se animan solas y el jugador las atraviesa sin bloquearse. Las capas de colisión del `Area2D` siguen en sus valores por defecto; se ajustarán en T10.

*(Las secciones de las demás tareas se añaden al empezar cada una.)*
