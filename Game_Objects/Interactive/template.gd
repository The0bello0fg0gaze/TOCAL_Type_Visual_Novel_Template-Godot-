extends Area2D

@onready var tag:Label = $Label


func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):
		tag.visible = true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group('Player'):
		tag.visible = false
