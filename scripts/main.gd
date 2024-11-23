extends Node2D

@onready var color_rect = $Camera2D/CanvasLayer/ColorRect

func _ready():
	$MovingObstacles/MovingObstacle2/CharacterBody2D/AnimationPlayer.seek(0.3)
	
func _process(_delta: float):
	color_rect.visible = Global.time_stop
