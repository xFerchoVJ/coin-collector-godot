extends CanvasLayer

signal button_pressed
@onready var label: Label = $CenterContainer/VBoxContainer/Label

func _ready() -> void:
	visible = false

func update_label(msg: String) -> void:
	label.text = msg
	visible = true

func _on_button_pressed() -> void:
	button_pressed.emit()
