extends Control

@onready var lable:Label = $MarginContainer/Label

# its like a append function but for a string you can add more functonalities here for more complex
# animations. Example in  Game_Objects/Interactive/template.gd
func dialog( text:String ) -> void:
	lable.text += text

# Just clear the text box and reuse it for new text.
func clear() -> void:
	lable.text = ""
