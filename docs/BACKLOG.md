# Backlog — Coin Collector (para Linear)

Linear: team `XFE` (Xferchovj), proyecto `Coin Collector`. Un milestone por fase. **Estado: pendiente de aprobación; aún no hay issues creados.**

Esfuerzo estimado: la mayoría de tareas toma 20–60 min. Las pistas no dan la solución completa; las pides con más detalle durante la tarea.

---

# M0 — Preparación

## T01 — Inicializar Git y ajustar `.gitignore`
- **Goal:** tener un repositorio limpio, con el primer commit y sin archivos generados.
- **Aprendizaje:** qué guarda Git de un proyecto Godot y qué no (`.godot/`, caché de importación).
- **Checklist:**
  - [ ] Ejecutar `git init` en la raíz del proyecto.
  - [ ] Revisar el `.gitignore` y el `.gitattributes` que Godot generó.
  - [ ] Añadir `Thumbs.db` al `.gitignore`.
  - [ ] Hacer `git status` y comprobar que `.godot/` no aparece.
  - [ ] Hacer el primer commit.
- **Pistas:** la carpeta `.godot/` es caché regenerable, como `tmp/` y `log/` en Rails. Los archivos `.import` sí se versionan.
- **Aceptación:** el primer commit existe, `.godot/` y `Thumbs.db` están ignorados, y los `.import` de `Assets/` están incluidos.
- **Errores comunes:** commitear `.godot/`; olvidar los `.import`.
- **Dependencias:** ninguna.
- **Esfuerzo:** 20 min.

## T02 — Configurar pixel art y organizar carpetas
- **Goal:** que el proyecto muestre los sprites de 8 px nítidos y tenga una estructura clara.
- **Aprendizaje:** Project Settings, resolución base, modos de stretch, filtro de texturas, el `FileSystem` dock y `res://`.
- **Checklist:**
  - [ ] Elegir una resolución base pequeña (por ejemplo 320x180) en Project Settings → Display → Window.
  - [ ] Ajustar el stretch mode y el aspect para que escale sin deformar.
  - [ ] Poner el filtro por defecto de texturas en Nearest.
  - [ ] Crear carpetas como `scenes/`, `scripts/` y `ui/`.
  - [ ] Si mueves algo, hazlo desde el FileSystem dock de Godot, para no romper referencias.
- **Pistas:** busca "Default Texture Filter" en Rendering → Textures. El stretch mode `canvas_items` ya está puesto en este proyecto.
- **Aceptación:** al insertar un sprite en una escena de prueba se ve nítido, sin borrosidad, y la estructura de carpetas está acordada.
- **Errores comunes:** mover archivos desde el explorador de Windows; dejar el filtro en Linear.
- **Dependencias:** T01.
- **Esfuerzo:** 30 min.

---

# M1 — Jugador

## T03 — Escena Player
- **Goal:** una escena reutilizable del jugador, con sprite y colisión.
- **Aprendizaje:** escenas y nodos, el árbol de nodos, `CharacterBody2D`, `Sprite2D` o `AnimatedSprite2D`, `CollisionShape2D` y formas de colisión.
- **Checklist:**
  - [ ] Crear `player.tscn` con un `CharacterBody2D` como raíz.
  - [ ] Añadir un sprite del jugador (`Assets/Strips/Player/Player Idle.png`).
  - [ ] Añadir un `CollisionShape2D` con una forma ajustada al sprite.
  - [ ] Guardar la escena y ponerla en una escena de prueba.
  - [ ] Ejecutar con F6 y comprobar que se ve.
- **Pistas:** una escena es como un componente reutilizable. Un `CharacterBody2D` necesita siempre una forma de colisión hija, y la tira de 4 frames de 8x8 no debe verse como 4 sprites juntos.
- **Aceptación:** el jugador aparece en pantalla, nítido, con una colisión del tamaño correcto (visible con Debug → Visible Collision Shapes).
- **Errores comunes:** olvidar la forma de colisión; ver los 4 frames a la vez.
- **Dependencias:** T02.
- **Esfuerzo:** 30 min.

## T04 — Movimiento top-down con Input Map
- **Goal:** mover al jugador con el teclado.
- **Aprendizaje:** Input Map, `Input.get_vector`, `_physics_process`, `velocity` y `move_and_slide`, GDScript tipado.
- **Checklist:**
  - [ ] Definir (o revisar) las acciones de movimiento en Project Settings → Input Map.
  - [ ] Crear un script en el Player con `@export var speed: float`.
  - [ ] Leer la dirección y asignar `velocity`.
  - [ ] Llamar a `move_and_slide()`.
  - [ ] Probar que la diagonal no es más rápida.
- **Pistas:** `Input.get_vector` ya devuelve el vector normalizado. Las físicas van en `_physics_process`, no en `_process`. Una velocidad de 8 px/s es mínima; piensa en cuántos píxeles por segundo quieres.
- **Aceptación:** el jugador se mueve en las 4 direcciones y en diagonal a velocidad constante, y el script está tipado.
- **Errores comunes:** usar `_process`; olvidar `move_and_slide()`; multiplicar por `delta` la velocidad que usa `move_and_slide`.
- **Dependencias:** T03.
- **Esfuerzo:** 40 min.

## T05 — Animaciones idle y walk
- **Goal:** que el jugador se anime según se mueva o no.
- **Aprendizaje:** `AnimatedSprite2D`, `SpriteFrames`, recortar frames de una tira, FPS de animación, `flip_h`.
- **Checklist:**
  - [ ] Cambiar el sprite por un `AnimatedSprite2D`.
  - [ ] Crear las animaciones `idle` y `walk` a partir de los strips.
  - [ ] Reproducir una u otra desde el script según la velocidad.
  - [ ] Voltear el sprite según la dirección horizontal.
- **Pistas:** en el editor de SpriteFrames hay "Add frames from Sprite Sheet". Para una tira de 4 frames, piensa en cuántas columnas y filas son. Ojo con el flip cuando el jugador está quieto.
- **Aceptación:** el jugador reproduce `idle` quieto y `walk` en movimiento, y mira a izquierda o derecha.
- **Errores comunes:** dividir mal la tira; llamar a `play()` en cada frame y reiniciar la animación.
- **Dependencias:** T04.
- **Esfuerzo:** 45 min.

---

# M2 — Habitación

## T06 — TileSet y pintar la habitación
- **Goal:** dibujar una habitación con el tileset del pack.
- **Aprendizaje:** `TileSet`, `TileMapLayer`, tamaño de tile, atlas y pintar tiles.
- **Checklist:**
  - [ ] Crear `level.tscn` con un `TileMapLayer`.
  - [ ] Crear un `TileSet` con tiles de 8x8 y asignarle `Terrain Sheet.png`.
  - [ ] Pintar suelo y paredes (puedes mirar `Assets/Guide.png`).
  - [ ] Dejar un hueco en la pared para la salida.
- **Pistas:** el `TileSet` se crea desde el panel inferior del `TileMapLayer`. Comprueba que el tamaño del tile es 8x8, no el 16x16 por defecto. Usa `TileMapLayer`, no `TileMap`.
- **Aceptación:** hay una habitación cerrada dibujada, sin huecos ni tiles mal cortados.
- **Errores comunes:** dejar el tile size en 16; usar `TileMap`, que es el nodo antiguo.
- **Dependencias:** T02.
- **Esfuerzo:** 45 min.

## T07 — Colisiones de paredes y collision layers
- **Goal:** que el jugador choque con las paredes.
- **Aprendizaje:** physics layers en `TileSet`, polígonos de colisión por tile, collision layers y masks, nombrar layers.
- **Checklist:**
  - [ ] Añadir una physics layer al `TileSet`.
  - [ ] Dibujar la colisión en los tiles de pared.
  - [ ] Nombrar las layers (por ejemplo `world`, `player`, `enemy`, `pickup`) en Project Settings.
  - [ ] Configurar layer y mask del jugador y del mapa.
  - [ ] Probar en la escena de prueba.
- **Pistas:** *layer* es "en qué capa estoy"; *mask* es "contra qué capas choco". Si el jugador atraviesa las paredes, mira primero esos dos valores.
- **Aceptación:** el jugador no atraviesa ninguna pared, en ninguna dirección.
- **Errores comunes:** layer y mask no coincidentes; olvidar activar la collision en los tiles.
- **Dependencias:** T06, T04.
- **Esfuerzo:** 45 min.

## T08 — Escena Level y Camera2D
- **Goal:** una escena de nivel que contiene al jugador y una cámara.
- **Aprendizaje:** instanciar escenas dentro de otras, `Camera2D`, zoom y límites.
- **Checklist:**
  - [ ] Instanciar `player.tscn` en `level.tscn`.
  - [ ] Colocarlo en un punto de inicio.
  - [ ] Añadir una `Camera2D` y ajustar zoom y límites.
  - [ ] Poner `level.tscn` como escena principal.
- **Pistas:** puedes poner la cámara como hija del jugador o como nodo aparte; decide y justifica por qué. Una sola habitación puede entrar entera en pantalla.
- **Aceptación:** al pulsar F5 se ve la habitación entera y puedo moverme dentro.
- **Errores comunes:** modificar `player.tscn` por error desde el nivel; límites de cámara mal puestos.
- **Dependencias:** T07, T05.
- **Esfuerzo:** 30 min.

---

# M3 — Monedas y HUD

## T09 — Escena Coin animada
- **Goal:** una escena de moneda con su animación.
- **Aprendizaje:** `Area2D`, `CollisionShape2D` en un área, `AnimatedSprite2D` en bucle (autoplay).
- **Checklist:**
  - [ ] Crear `coin.tscn` con un `Area2D` como raíz.
  - [ ] Añadir el `AnimatedSprite2D` con `Assets/Strips/Items/Coin.png`.
  - [ ] Añadir una colisión circular o rectangular.
  - [ ] Activar la animación en bucle y autoplay.
  - [ ] Colocar 3 o 4 monedas en el nivel.
- **Pistas:** un `Area2D` detecta solapamientos, pero no bloquea el movimiento.
- **Aceptación:** las monedas se animan en el nivel y el jugador pasa por encima sin quedar bloqueado.
- **Errores comunes:** usar un `StaticBody2D`; olvidar el autoplay.
- **Dependencias:** T08.
- **Esfuerzo:** 30 min.

## T10 — Recoger una moneda
- **Goal:** que la moneda desaparezca al tocarla.
- **Aprendizaje:** señales (`body_entered`), conectar señales por editor o por código, `queue_free`, filtrar por grupo.
- **Checklist:**
  - [ ] Añadir el jugador a un grupo `player`.
  - [ ] Conectar `body_entered` del `Area2D` a un método del script de la moneda.
  - [ ] Comprobar que el cuerpo es el jugador.
  - [ ] Eliminar la moneda con `queue_free()`.
- **Pistas:** una señal es un evento, como un callback o un `after_commit` de Rails. Ajusta la mask del área para que solo detecte al jugador.
- **Aceptación:** cada moneda desaparece al tocarla y no se activa por enemigos ni paredes.
- **Errores comunes:** mask incorrecta; llamar a `free()` en vez de `queue_free()`.
- **Dependencias:** T09.
- **Esfuerzo:** 40 min.

## T11 — Contador de monedas y HUD
- **Goal:** mostrar en pantalla cuántas monedas llevo.
- **Aprendizaje:** señales personalizadas (`signal`, `emit`), `CanvasLayer`, `Label`, comunicación entre nodos hermanos o distantes.
- **Checklist:**
  - [ ] Crear `hud.tscn` con un `CanvasLayer` y un `Label`.
  - [ ] Definir una señal en la moneda (por ejemplo `collected`).
  - [ ] Hacer que el nivel cuente las monedas recogidas y actualice el HUD.
  - [ ] Mostrar el formato "x / total".
- **Pistas:** el principio "call down, signal up": los padres llaman a los hijos y los hijos emiten señales. El total se puede sacar de un grupo `coins`.
- **Aceptación:** el HUD muestra el progreso y se actualiza al recoger cada moneda.
- **Errores comunes:** que la moneda acceda al HUD con un `get_node` frágil; contar mal el total.
- **Dependencias:** T10.
- **Esfuerzo:** 50 min.

---

# M4 — Enemigos

## T12 — Escena Enemy animada
- **Goal:** una escena de enemigo con sus animaciones.
- **Aprendizaje:** repasar escenas y `AnimatedSprite2D`; elegir entre `CharacterBody2D` y `Area2D`.
- **Checklist:**
  - [ ] Crear `enemy.tscn` con el nodo raíz que elijas, y justificar la elección.
  - [ ] Crear las animaciones `idle` y `walk` desde `Assets/Strips/Enemy/`.
  - [ ] Añadir una colisión.
  - [ ] Colocar un enemigo en el nivel.
- **Pistas:** piensa qué necesita el enemigo: ¿ser empujado por paredes o solo detectar al jugador?
- **Aceptación:** el enemigo aparece en el nivel con su animación.
- **Errores comunes:** olvidar la colisión; reutilizar sin querer una layer del jugador.
- **Dependencias:** T08.
- **Esfuerzo:** 30 min.

## T13 — Patrulla del enemigo
- **Goal:** que el enemigo vaya y venga entre dos puntos.
- **Aprendizaje:** `@export`, movimiento por código, `Tween` o dirección invertida al llegar a un extremo, `Marker2D` (opcional).
- **Checklist:**
  - [ ] Exponer en el inspector la velocidad y los puntos o la distancia de patrulla.
  - [ ] Mover al enemigo hacia un extremo.
  - [ ] Invertir la dirección al llegar.
  - [ ] Voltear el sprite y cambiar a la animación `walk`.
- **Pistas:** hay dos enfoques, un `Tween` en bucle y `_physics_process` con una dirección. Decide cuál te resulta más claro. Un enemigo = un recorrido configurable desde el inspector.
- **Aceptación:** el enemigo patrulla indefinidamente y distintos enemigos pueden tener recorridos distintos.
- **Errores comunes:** coordenadas locales frente a globales; acumulación de error al invertir.
- **Dependencias:** T12.
- **Esfuerzo:** 50 min.

## T14 — Contacto con el enemigo y derrota
- **Goal:** que tocar a un enemigo termine la partida.
- **Aprendizaje:** detección de contacto con `Area2D`, señales entre escenas, desactivar un nodo (`set_physics_process`), animación `dead`.
- **Checklist:**
  - [ ] Añadir un `Area2D` de contacto al enemigo.
  - [ ] Emitir una señal cuando el jugador entra.
  - [ ] Que el jugador reproduzca `Player Dead` y deje de moverse.
  - [ ] Que el nivel reciba la señal y registre la derrota (por ahora con un `print`).
- **Pistas:** decide quién es responsable de qué: el enemigo avisa, el nivel decide. El jugador muerto no debe poder moverse.
- **Aceptación:** al tocar a un enemigo el jugador muere, se detiene y el nivel registra la derrota una sola vez.
- **Errores comunes:** que la señal se emita varias veces; seguir recibiendo input tras morir.
- **Dependencias:** T13.
- **Esfuerzo:** 50 min.

---

# M5 — Bucle de juego

## T15 — La salida
- **Goal:** una salida que se activa al recoger todas las monedas.
- **Aprendizaje:** estado del nivel, activar y desactivar colisiones o monitoring, `Area2D` de meta, cambiar un sprite.
- **Checklist:**
  - [ ] Crear `exit.tscn` (puedes usar `Assets/Guide.png` como referencia visual).
  - [ ] Dejarla cerrada o inactiva al empezar.
  - [ ] Activarla cuando se recoge la última moneda.
  - [ ] Detectar que el jugador entra en la salida activa.
- **Pistas:** ¿quién sabe cuándo se han recogido todas las monedas? Ese nodo debería activar la salida. Cambiar `monitoring` dentro de una señal puede dar un error, así que investiga `set_deferred`.
- **Aceptación:** la salida no hace nada hasta tener todas las monedas, y después detecta al jugador.
- **Errores comunes:** cambiar propiedades físicas dentro de una señal sin `set_deferred`.
- **Dependencias:** T11.
- **Esfuerzo:** 45 min.

## T16 — Pantallas de victoria y derrota
- **Goal:** mostrar un mensaje y poder reiniciar tras ganar o perder.
- **Aprendizaje:** nodos `Control`, `Button`, anclajes y contenedores, `reload_current_scene`.
- **Checklist:**
  - [ ] Crear una UI de fin de partida con un título y un botón de reinicio.
  - [ ] Mostrarla según gane o pierda.
  - [ ] Reiniciar el nivel con el botón.
  - [ ] Conectar la derrota de T14 y la victoria de T15.
- **Pistas:** reutiliza la misma escena con distinto texto en vez de crear dos. Usa contenedores (`CenterContainer`, `VBoxContainer`) y no posiciones a mano.
- **Aceptación:** puedo ganar y perder, ver el mensaje correcto y reiniciar.
- **Errores comunes:** que la UI quede detrás del juego; no restaurar el estado al reiniciar.
- **Dependencias:** T14, T15.
- **Esfuerzo:** 55 min.

## T17 — Menú principal
- **Goal:** un menú que inicia el juego.
- **Aprendizaje:** `change_scene_to_file`, escena principal, `Control` y botones, `get_tree().quit()`.
- **Checklist:**
  - [ ] Crear `main_menu.tscn` con el título y los botones Jugar y Salir.
  - [ ] Que Jugar cargue el nivel.
  - [ ] Que Salir cierre el juego.
  - [ ] Poner el menú como escena principal.
- **Pistas:** puedes usar `GUIHeader.png` para el título. Piensa si el fin de partida debe poder volver al menú.
- **Aceptación:** el juego arranca en el menú y se puede jugar de principio a fin desde ahí.
- **Errores comunes:** rutas de escena mal escritas; olvidar cambiar la escena principal.
- **Dependencias:** T16.
- **Esfuerzo:** 40 min.

## T18 — Revisión final contra la DoD
- **Goal:** comprobar el MVP completo contra la definición de terminado y cerrar lo pendiente.
- **Aprendizaje:** revisar el trabajo, depurar con la consola y el debugger, y (opcional) exportar.
- **Checklist:**
  - [ ] Recorrer cada punto de la DoD en `docs/DEVELOPMENT_PLAN.md`.
  - [ ] Revisar la consola en busca de errores y advertencias.
  - [ ] Comprobar que el código está tipado.
  - [ ] Actualizar `docs/LEARNING_PROGRESS.md`.
  - [ ] (Opcional) Exportar una versión para Windows.
- **Pistas:** si algo falla, vuelve a la tarea correspondiente y márcala como `Needs revision`.
- **Aceptación:** todos los puntos de la DoD están verificados, y lo hacemos juntos.
- **Errores comunes:** dar por bueno lo que no se ha probado desde el menú.
- **Dependencias:** T17.
- **Esfuerzo:** 45 min.
