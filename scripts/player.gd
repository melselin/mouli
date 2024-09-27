extends CharacterBody2D

var current_dir = 'none'

func _ready():
	$AnimatedSprite2D.play("front_idle")
	
func _physics_process(delta):
	player_movement(delta)

func player_movement(delta):
	
	if Input.is_action_just_pressed("quit"):
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
		if Dialogic.current_timeline != null:
			Dialogic.end_timeline()
	
	if Input.is_action_pressed('ui_right'):
		current_dir = 'right'
		play_anim(1)
		velocity.x = Global.speed
		velocity.y = 0
	elif Input.is_action_pressed('ui_left'):
		current_dir = 'left'
		play_anim(1)
		velocity.x = -Global.speed
		velocity.y = 0	
	elif Input.is_action_pressed('ui_down'):
		current_dir = 'down'
		play_anim(1)
		velocity.x = 0
		velocity.y = Global.speed
	elif Input.is_action_pressed('ui_up'):
		current_dir = 'up'
		play_anim(1)
		velocity.x = 0
		velocity.y = -Global.speed
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()

func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == 'left':
		anim.flip_h = false
		if movement == 1:
			anim.play('side_walk')
		elif movement == 0:
			anim.play('side_idle')
	if dir == 'right':
		anim.flip_h = true
		if movement == 1:
			anim.play('side_walk')
		elif movement == 0:
			anim.play('side_idle')	
	
	if dir == 'down':
		anim.flip_h = true
		if movement == 1:
			anim.play('front_walk')
		elif movement == 0:
			anim.play('front_idle')	
	
	if dir == 'up':
		anim.flip_h = true
		if movement == 1:
			anim.play('back_walk')
		elif movement == 0:
			anim.play('back_idle')	
