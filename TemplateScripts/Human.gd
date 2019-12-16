extends KinematicBody2D
#===============================OPTIONS====================================
var options = {
	'is_player'		: false,
	'sprite'		: preload('res://Hero/assets/human.png'),
	'evasion'		: 0,
	'heal_points'	: 100,
	'energy_points'	: 100,
	'speed'			: 5,
	'is_range'		: true,
	'damage'		: 50,
#	'arrow_options': {
#		'arrow_speed'		: 1000,
#		'arrow_texture'		: preload('res://Hero/Hero assets/fireball.png'),
#		'arrow_scene'		: preload('res://Arrow/arrow.tscn')
#		},	
	'attack': {
		'speed'		: 1000,
		'texture'	: preload('res://Hero/assets/fireball.png'),
		'scene'		: preload('res://Arrow/arrow.tscn'),
		},	
#	'control_options':{
#		'go_up': KEY_W,
#		'go_down':KEY_S,
#		'go_left':KEY_A,
#		'go_right':KEY_D,
#		'activate':KEY_F,
#		'attack':KEY_SPACE,
#		'spell1':KEY_1,
#		'spell2':KEY_2,
#		'spell3':KEY_3,
#		'spell4':KEY_4,
#		'spell5':KEY_5,
#		'spell6':KEY_6,
#		},
	'class': 'mage',
	'inventory': [],
	'spells': [ {
			'scene'		: preload('res://Spells/Fireball/Fireball.tscn'),
			'speed'		: 800,
			'cooldown' 	: 3,
			},
			{
			'scene'		: preload('res://Spells/Fireball/Fireball.tscn'),
			'speed'		: 800,
			'cooldown' 	: 3,
			},
			{
			'scene'		: preload('res://Spells/Fireball/Fireball.tscn'),
			'speed'		: 800,
			'cooldown' 	: 3,
			},
			{
			'scene'		: preload('res://Spells/Fireball/Fireball.tscn'),
			'speed'		: 800,
			'cooldown' 	: 3,
			},
			{
			'scene'		: preload('res://Spells/Fireball/Fireball.tscn'),
			'speed'		: 800,
			'cooldown' 	: 3,
			},
			{
			'scene'		: preload('res://Spells/Fireball/Fireball.tscn'),
			'speed'		: 800,
			'cooldown' 	: 3,
			},
		],
	}

#=========================move=functions=======================
# Called when the node enters the scene tree for the first time.
func _ready():
	#==================SET=COOLDOWN=TIMERS=======================
	if options['is_player'] == true:
		$spell1_reload.wait_time = options['spells'][0]['cooldown']
		$spell2_reload.wait_time = options['spells'][1]['cooldown']
		$spell3_reload.wait_time = options['spells'][2]['cooldown']
		$spell4_reload.wait_time = options['spells'][3]['cooldown']
		$spell5_reload.wait_time = options['spells'][4]['cooldown']
		$spell6_reload.wait_time = options['spells'][5]['cooldown']
	#===========================SET=VISUAL=OPTIONS========================
	$Sprite.set_texture(options['sprite'])
	$attack_reload.wait_time = options['speed']/10
	
#=========================walking==============================
var move_vector = Vector2()
var human_dir = "down"

func go_up():
	move_vector.y = -options['speed']*50
	human_dir = "up"
	if sign($Vertical_arrow_position.position.y) == 1:
		$Vertical_arrow_position.position.y *= -1
	move_and_slide(move_vector)
	move_vector.y = 0
func go_down():
	move_vector.y = options['speed']*50
	human_dir = "down"
	if sign($Vertical_arrow_position.position.y) == -1:
		$Vertical_arrow_position.position.y *= -1
	move_and_slide(move_vector)
	move_vector.y = 0
func go_left():
	move_vector.x = -options['speed']*50
	human_dir = "left"
	if sign($Horizontal_arrow_position.position.x) == 1:
		$Horizontal_arrow_position.position.x *= -1
	move_and_slide(move_vector)
	move_vector.x = 0
func go_right():
	move_vector.x = options['speed']*50
	human_dir = "right"
	if sign($Horizontal_arrow_position.position.x) == -1:
		$Horizontal_arrow_position.position.x *= -1
	move_and_slide(move_vector)
	move_vector.x = 0
func go_stay():	
	pass
#========================attacking==============================
var enable_attack = true
var enable_spell1 = true
var enable_spell2 = true
var enable_spell3 = true
var enable_spell4 = true
var enable_spell5 = true
var enable_spell6 = true

func go_attack():
	if	$attack_reload.time_left == 0:
		enable_attack = true
	if enable_attack == true:
		var spell = options['attack']['scene'].instance()
		if options['is_range']:
			add_child(spell)
		enable_attack = false
		$attack_reload.start()

func go_spell1():
	if	$spell1_reload.time_left == 0:
		enable_spell1 = true
	if enable_spell1 == true:
		var spell = options['spells'][0]['scene'].instance()
		add_child(spell)
		enable_spell1 = false
		$spell1_reload.start()

func go_spell2():
	if	$spell2_reload.time_left == 0:
		enable_spell2 = true
	if enable_spell2 == true:
		var spell = options['spells'][1]['scene'].instance()
		add_child(spell)
		enable_spell2 = false
		$spell2_reload.start()

func go_spell3():
	if	$spell3_reload.time_left == 0:
		enable_spell3 = true
	if enable_spell3 == true:
		var spell = options['spells'][2]['scene'].instance()
		add_child(spell)
		enable_spell3 = false
		$spell3_reload.start()
		
func go_spell4():
	if	$spell4_reload.time_left == 0:
		enable_spell4 = true
	if enable_spell4 == true:
		var spell = options['spells'][3]['scene'].instance()
		add_child(spell)
		enable_spell4 = false
		$spell4_reload.start()

func go_spell5():
	if	$spell5_reload.time_left == 0:
		enable_spell5 = true
	if enable_spell5 == true:
		var spell = options['spells'][4]['scene'].instance()
		add_child(spell)
		enable_spell5 = false
		$spell5_reload.start()

		
func go_spell6():
	if	$spell6_reload.time_left == 0:
		enable_spell6 = true
	if enable_spell6 == true:
		var spell = options['spells'][5]['scene'].instance()
		add_child(spell)
		enable_spell6 = false
		$spell6_reload.start()
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
#================================================DAMAGE=GETTER===================================
func get_damage(damage):
	if options['is_player']:
		options['heal_points'] -= damage
		if options['heal_points'] <= 0:
			die()
	else:
		options['heal_points'] -= damage
		if options['heal_points'] <= 0:
			die()
		
func die():
	queue_free()

#===============================================TOOLS============================================
func get_direction_options(speed):
	var vector = Vector2()
	var gl_pos = 0
	if human_dir == 'up':
		vector.y = -speed
		gl_pos = get_node("Vertical_arrow_position").global_position
	if human_dir == 'down':
		vector.y = speed
		gl_pos = get_node("Vertical_arrow_position").global_position
	if human_dir == 'left':
		vector.x = -speed
		gl_pos = get_node("Horizontal_arrow_position").global_position
	if human_dir == 'right':
		vector.x = speed
		gl_pos = get_node("Horizontal_arrow_position").global_position
	return {'vector':vector,'global_position':gl_pos}
		
