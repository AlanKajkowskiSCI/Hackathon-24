extends Area2D

@onready var label: Node = $ActionLabel
@onready var player: Node = get_parent().get_node("Player")

func _process(delta: float):
	if has_overlapping_bodies():
		label.visible = true
		
		if Input.is_action_just_pressed("read"):
			pass # TUTAJ DAJ KOD NA DRUGI ŚWIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAATTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
	else:
		label.visible = false
