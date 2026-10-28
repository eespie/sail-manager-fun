extends Node
class_name Utils


static func format_money(_amount : int) -> String:
	var str_amount : String = ''
	var unit : String = ''
	
	if _amount == 0:
		str_amount = '0'
	elif _amount % 1000000 == 0:
		unit = 'M'
		str_amount = "%d" % floori(_amount / 1000000.0)
	elif _amount % 1000 == 0:
		unit = 'k'
		str_amount = write_numbers_with_coma(_amount / 1000.0)
	else:
		str_amount = write_numbers_with_coma(_amount)
	return str("$", str_amount, unit)


static func write_numbers_with_coma(_amount : int) -> String :
	var str_amount : String = ""
	while _amount > 0:
		var part = _amount % 1000
		_amount = floori((_amount - part) / 1000.0)
		var str_part
		if _amount > 0:
			str_part = ",%03d" % part
		else:
			str_part = "%d" % part
		str_amount = str_part + str_amount
	return str_amount

static func clear_all_children(parent : Node) -> void:
	for child : Node in parent.get_children():
		child.queue_free()
