extends Control


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://Scenes/options_menu.tscn")


func _on_button_3_pressed():
	get_tree().quit()
