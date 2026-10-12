extends CanvasLayer

@onready var label: Label = $Label

func update_counter(collected: int, total: int) -> void:
	label.text = "%d / %d monedas recolectadas" % [collected, total]
