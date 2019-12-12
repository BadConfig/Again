extends Node2D

func _process(delta):
	#=======================key=input====================================
	if Input.is_action_pressed('ui_up'):
			get_parent().go_up()
	elif Input.is_action_pressed('ui_down'):
			get_parent().go_down()
	if Input.is_action_pressed('ui_left'):
			get_parent().go_left()
	elif Input.is_action_pressed('ui_right'):
			get_parent().go_right()
	if Input.is_action_just_pressed('ui_shoot'):
			get_parent().go_attack()
	elif Input.is_action_just_pressed('ui_spell1'):
			get_parent().go_spell1()
	elif Input.is_action_just_pressed('ui_spell2'):
			get_parent().go_spell2()
	elif Input.is_action_just_pressed('ui_spell3'):
			get_parent().go_spell3()	
	elif Input.is_action_just_pressed('ui_spell4'):
			get_parent().go_spell4()
	elif Input.is_action_just_pressed('ui_spell5'):
			get_parent().go_spell5()
	elif Input.is_action_just_pressed('ui_spell6'):
			get_parent().go_spell6()
