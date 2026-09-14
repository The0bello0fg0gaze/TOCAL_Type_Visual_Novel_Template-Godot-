extends Control

@export var Play:Button
@export var Settins:Button
@export var Quit:Button


func _ready() -> void:
	Play.pressed.connect(_on_play_pressed)
	Settins.pressed.connect(_on_setting_pressed)
	Quit.pressed.connect(_on_quit_pressed)
	
func _on_play_pressed() -> void:
	DataManager.reset()
	get_tree().change_scene_to_file(DataManager.current_level)
	
func _on_setting_pressed() -> void:
	return

func _on_quit_pressed() -> void:
	get_tree().quit()
