extends Node2D

@onready var button_1: Node = $Button1
@onready var button_2: Node = $Button2
@onready var button_3: Node = $Button3

@onready var timer: Node = $Timer
@onready var animation: Node = $PuzzleEnterance/AnimationPlayer

var sequence: Array = []
var pushable: bool = true

func check_for_answer():
	if len(sequence) == 3:
		if sequence == [1, 2, 3]:
			animation.play("open")
		else:
			timer.start()

func reset_button(button: Node):
	button.global_position.y -= 16
	button.get_node("CollisionShape2D").set_deferred("disabled", false)

func _on_button_1_body_entered(_body: Node2D):
	if pushable:
		button_1.global_position.y += 16
		button_1.get_node("CollisionShape2D").set_deferred("disabled", true)
		sequence.append(1)
		check_for_answer()

func _on_button_2_body_entered(_body: Node2D):
	if pushable:
		button_2.global_position.y += 16
		button_2.get_node("CollisionShape2D").set_deferred("disabled", true)
		sequence.append(2)
		check_for_answer()

func _on_button_3_body_entered(_body: Node2D):
	if pushable:
		button_3.global_position.y += 16
		button_3.get_node("CollisionShape2D").set_deferred("disabled", true)
		sequence.append(3)
		check_for_answer()

func _on_timer_timeout():
	pushable = false
	reset_button(button_1)
	reset_button(button_2)
	reset_button(button_3)
	sequence.clear()

func _on_button_1_body_exited(_body: Node2D):
	pushable = true

func _on_button_2_body_exited(_body: Node2D):
	pushable = true

func _on_button_3_body_exited(_body: Node2D):
	pushable = true
