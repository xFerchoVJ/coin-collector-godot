<div align="center">

# 🪙 Coin Collector

**Un juego 2D top-down de exploración hecho con Godot 4 como proyecto de aprendizaje.**

![Godot](https://img.shields.io/badge/Godot-4.7.2-478CBF?logo=godotengine&logoColor=white)
![GDScript](https://img.shields.io/badge/GDScript-tipado-355570)
![Renderer](https://img.shields.io/badge/Renderer-GL%20Compatibility-5C5C5C)
![Estado](https://img.shields.io/badge/MVP-completado-2EA44F)

</div>

---

## 🎮 ¿De qué trata?

Exploras una habitación, recoges todas las monedas, esquivas a los enemigos que patrullan y, cuando la salida se abre, corres hacia ella para ganar. Si un enemigo te toca, pierdes.

> **Explorar → recoger monedas → esquivar enemigos → la salida se abre → ganar (o perder y reiniciar).**

## 🎓 Un proyecto para aprender

Coin Collector nació como **ejercicio de aprendizaje**. Vengo del desarrollo web (Rails) y quería entender cómo se construye un videojuego de principio a fin: escenas, nodos, señales, físicas y arquitectura de juego.

Lo construí en 18 tareas pequeñas y ordenadas, con la guía de un mentor técnico (Claude Code) que me daba pistas progresivas en vez de la solución. El código lo escribí yo. El seguimiento de lo que fui aprendiendo en cada tarea está en [`docs/LEARNING_PROGRESS.md`](docs/LEARNING_PROGRESS.md).

## ✨ Lo que se implementó

| Fase | Qué se construyó | Conceptos de Godot practicados |
|---|---|---|
| **M0 · Preparación** | Repo, `.gitignore` y configuración para pixel art (viewport 320×180, ventana 1280×720, filtro Nearest) | Git con Godot, ajustes de proyecto, `res://`, importación de assets |
| **M1 · Jugador** | Personaje con movimiento en 8 direcciones (WASD) y animaciones idle y walk | `CharacterBody2D`, Input Map, `_physics_process`, `move_and_slide`, `AnimatedSprite2D` |
| **M2 · Habitación** | Sala con paredes sólidas y cámara | `TileSet`, `TileMapLayer`, collision layers y masks, `Camera2D`, instanciar escenas |
| **M3 · Monedas y HUD** | Monedas animadas y recogibles, contador en pantalla | `Area2D`, señales, `queue_free`, `CanvasLayer`, `Label` |
| **M4 · Enemigos** | Enemigos animados que patrullan; tocarlos es derrota | Patrulla, detección de contacto, `@export` |
| **M5 · Bucle de juego** | Salida que se abre con todas las monedas, pantallas de victoria y derrota con reinicio, y menú principal | `change_scene_to_file`, nodos `Control`, botones, flujo entre escenas |

### Características del MVP

- 🏃 Movimiento fluido con animaciones idle y walk.
- 🧱 Habitación con colisiones, hecha con `TileMapLayer`.
- 🪙 Monedas animadas y un HUD con el progreso.
- 👾 Enemigos que patrullan y derrotan al jugador al contacto.
- 🚪 Salida que se activa al recoger todas las monedas.
- 🏁 Pantallas de victoria y derrota con botón de reinicio.
- 📋 Menú principal con *Jugar* y *Salir*.

## 🕹️ Controles

| Acción | Tecla |
|---|---|
| Arriba | `W` |
| Izquierda | `A` |
| Abajo | `S` |
| Derecha | `D` |

## 🚀 Cómo ejecutarlo

1. Instala [Godot 4.7.2](https://godotengine.org/download) (versión estándar, no .NET).
2. Clona el repositorio:
   ```bash
   git clone git@github.com:xFerchoVJ/coin-collector-godot.git
   ```
3. Abre Godot, pulsa **Importar** y selecciona el archivo `project.godot`.
4. Pulsa **F5** para jugar. La escena principal es el menú.

## 🗂️ Estructura del proyecto

```
coin-collector/
├── Assets/     # Pack de arte pixel-art (sprites de 8x8 px)
├── scenes/     # Player, Enemy, Coin, Exit, Level, HUD, pantallas...
├── scripts/    # Un script GDScript tipado por escena
├── ui/         # Recursos de interfaz
├── docs/       # Plan de desarrollo, backlog y progreso de aprendizaje
└── project.godot
```

## 📚 Documentación

- [`docs/DEVELOPMENT_PLAN.md`](docs/DEVELOPMENT_PLAN.md): roadmap y definición de terminado del MVP.
- [`docs/BACKLOG.md`](docs/BACKLOG.md): las 18 tareas con sus checklists y criterios de aceptación.
- [`docs/LEARNING_PROGRESS.md`](docs/LEARNING_PROGRESS.md): qué aprendí, qué implementé y qué dificultades tuve en cada tarea.

## 🧰 Tecnologías

- **Motor:** Godot 4.7.2 stable, renderer GL Compatibility.
- **Lenguaje:** GDScript tipado, siguiendo las convenciones de Godot 4.
- **Gestión de tareas:** Linear.

## 🎨 Créditos

El arte pixel-art pertenece a su autor original (ver [`Assets/readme.txt`](Assets/readme.txt)). Se usa aquí con fines educativos.

## 🔭 Posibles mejoras

El MVP está completo. Ideas para seguir aprendiendo: varias habitaciones, sistema de vidas con corazones, sonido y música, y exportar una versión para Windows.
