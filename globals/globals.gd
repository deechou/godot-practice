extends Node

signal stat_change

var lives = 3:
	set(value):
		lives = value
		stat_change.emit()

var health = 60:
	set(value):
		health = value
		stat_change.emit()
		
var laser_amount = 20000:
	set(value):
		laser_amount = value
		stat_change.emit()
		
var grenade_amount = 10:
	set(value):
		grenade_amount = value
		stat_change.emit()

var num_cats = 1:
	set(value):
		num_cats = value
		stat_change.emit()
