extends CollisionShape2D




func _on_Hit_area_area_entered(area):
	var my_instance = get_parent().get_parent().get_parent()
	var target_instance = area.get_parent()
	var me = get_parent().get_parent()
	print ('act')
	if target_instance.options['is_player'] != my_instance.options['is_player']:
		print ('got')
		target_instance.get_damage(me.options['damage'])
		me.queue_free()
		