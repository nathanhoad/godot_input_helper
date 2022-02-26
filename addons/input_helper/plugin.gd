tool

extends EditorPlugin


func _enter_tree():
	add_autoload_singleton("InputHelper", "res://addons/input_helper/input_helper.gd")


func _exit_tree():
	remove_autoload_singleton("InputHelper")
