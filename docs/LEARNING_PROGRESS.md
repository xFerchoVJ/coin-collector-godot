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
| T06 | TileSet y pintar la habitación | M2 | Not started | XFE-10 |
| T07 | Colisiones de paredes y collision layers | M2 | Not started | XFE-11 |
| T08 | Escena Level y Camera2D | M2 | Not started | XFE-12 |
| T09 | Escena Coin animada | M3 | Not started | XFE-13 |
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

*(Las secciones de las demás tareas se añaden al empezar cada una.)*
