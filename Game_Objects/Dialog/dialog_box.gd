extends Control

@onready var lable:Label = $MarginContainer/Label

func dialog( text:String ) -> void:
	lable.text += text
	
func clear() -> void:
	lable.text = ""
