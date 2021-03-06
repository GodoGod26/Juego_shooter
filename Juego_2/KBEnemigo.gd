extends KinematicBody


var puedeDisparar = true
var velocidadDisparo=50

func _physics_process(delta):
	if $RayCast.is_colliding():
		dispararAhora()

	
func dispararAhora():
	if puedeDisparar:
		DISPARAR()
		puedeDisparar=false
		$Timer.start()
		
		
func DISPARAR():
	var disparos=load("res://Disparos/DisparoClase.tscn").instance()
	add_child(disparos)
	disparos.set_as_toplevel(true)
	disparos.global_transform=$Position3D.global_transform
	disparos.linear_velocity= disparos.global_transform.basis.x*velocidadDisparo


func _on_Timer_timeout():
	puedeDisparar = true
