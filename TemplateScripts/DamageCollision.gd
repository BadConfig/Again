extends CollisionShape2D

func _on_Hit_area_area_entered(area):
	var me = get_parent().get_parent()
	var my_object = me.get_parent()
	var target_object = area.get_parent()
	if my_object.options['is_player'] != target_object.options['is_player']:
		target_object.get_damage(me.options['damage'])
	me.queue_free()
