extends Control

@onready var Options:Button = $MarginContainer/MarginContainer/VBoxContainer/Option
@onready var Continue:Button = $MarginContainer/MarginContainer/VBoxContainer/Continue
@onready var MainMenu:Button = $"MarginContainer/MarginContainer/VBoxContainer/Main Menu"

func  _ready() -> void:
	Options.pressed.connect(options_is_pressed)
	Continue.pressed.connect(continue_is_pressed)
	MainMenu.pressed.connect(main_menu_is_pressed)

func options_is_pressed() -> void:
	pass

func continue_is_pressed() -> void:
	pass

func main_menu_is_pressed() -> void:
	get_tree().change_scene_to_file(DataManager.main_menu)
	
