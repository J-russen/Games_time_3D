extends Node3D

var life = Variables.length
func kill():
	life -= 1
	if life == 0:
		queue_free()
func grow():
	life+=1
func get_xyz():
	return position
