extends Area2D

func _on_Area2D_area_entered(area):
	var me = get_parent()
	var my_object = me.get_parent()
	var target_object = area.get_parent()
	if my_object.options['is_player'] != target_object.options['is_player']:
		target_object.get_damage(me.options['damage'])
	me.queue_free()
