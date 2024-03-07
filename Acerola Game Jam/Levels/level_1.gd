extends Node2D

# Called on scene creation
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for i in $player.get_slide_collision_count():
		var collision = $player.get_slide_collision(i)
		if collision.get_collider() == $player2:
			print("player 2 collision")
			$player2/ColorRect.color = $player2.color12
		else:
			continue
