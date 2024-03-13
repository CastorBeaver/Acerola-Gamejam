extends Node2D

var colour_dict = {"3":Color(1,1,0,1),"5":Color(1,0,1,1),"7":Color(1,1,1,1)}

func check1(): #Checks player to player2
	if is_instance_valid($player2):
		for i in $player.get_slide_collision_count():
			var collision = $player.get_slide_collision(i)
			if collision.get_collider() == $player2:
				$player.id += $player2.id
				remove_child(get_node('player2'))
				$player/ColorRect.color = colour_dict[str($player.id)]
			else:
				pass
	else:
		pass
func check2(): #Checks player to player3
	if is_instance_valid($player3):
		for i in $player.get_slide_collision_count():
			var collision = $player.get_slide_collision(i)
			if collision.get_collider() == $player3:
				$player.id += $player3.id
				remove_child(get_node('player3'))
				$player/ColorRect.color = colour_dict[str($player.id)]
			else:
				pass
	else:
		pass
func check3(): #Checks player2 to player3
	if is_instance_valid($player2) and is_instance_valid($player3):
		for i in $player2.get_slide_collision_count():
			var collision = $player2.get_slide_collision(i)
			if collision.get_collider() == $player:
				pass
			elif collision.get_collider() == $player3:
				remove_child(get_node('player3'))
				$player2.id = 6
				$player2/ColorRect.color = Color(0,1,1,1)
	else:
		pass

# Called on scene creation
func _ready():
	print(get_tree().current_scene.name)
	$player2/ColorRect.color = Color(0,1,0,1)
	$player3/ColorRect.color = Color(0,0,1,1) 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if is_instance_valid($player2) and is_instance_valid($player3):
		check1()
		check2()
		check3()
	elif is_instance_valid($player3):
		check2()
	elif is_instance_valid($player2):
		check1()
	else:
		pass
		

func _on_area_2d_body_entered(body):
	if body == $player and $player/ColorRect.color == Color(1,1,1,1):
		if get_tree().current_scene.name == "Level1":
			get_tree().change_scene_to_file("res://Levels/level_2.tscn")
		elif get_tree().current_scene.name == "level2":
			get_tree().change_scene_to_file("res://Levels/level_3.tscn")
		else:
			get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
