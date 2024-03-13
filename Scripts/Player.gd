extends CharacterBody2D

@export var id = 1

var cur_level = 1

var run_speed = 350
var jump_speed = -750
var gravity = 2500

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_just_pressed('ui_up')

	if is_on_floor() and jump:
		velocity.y = jump_speed
	if right:
		velocity.x += run_speed
	if left:
		velocity.x -= run_speed

func _physics_process(delta):
	velocity.y += gravity * delta
	get_input()
	move_and_slide()


func _on_level_goal_reach():
	cur_level += 1
