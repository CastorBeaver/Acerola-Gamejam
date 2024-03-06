extends Control

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Levels/level_1.tscn")

func _on_options_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/options_menu.tscn")

func _on_controls_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/controls_menu.tscn")

func _on_exit_button_pressed():
	get_tree().quit()
