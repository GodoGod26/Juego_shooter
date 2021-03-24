extends KinematicBody


var puedeDisparar = true
var velocidadDisparo=50

func _physics_process(delta):
	if $RayCast.is_colliding():
		#DISPARA()

	
