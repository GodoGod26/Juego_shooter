extends KinematicBody

var movJugador=Vector3()
const up=Vector3(0,1,0)
export var numJugador=1
export var avance=10

var moverEstado=0
const minBlendSpeed=0.125
const blendCorrer=0.075
const blendIniciar=0.01
const velDisparo=50

func disparar():
	var disparos=load("res://Disparos/DisparoClase.tscn").instance()
	add_child(disparos)
	disparos.set_as_toplevel(true)
	disparos.global_transform=$ControlCamara/ControlHorizontal/ControlVertical/Frente.global_transform
	disparos.linear_velocity=disparos.global_transform.basis.x * velDisparo

func _input(event):
	if Input.is_action_pressed("Disparar"):
		disparar()


func _physics_process(delta):
	movimiento()
	animacionTree()
	
func movimiento():
	var moverDir=moverDosDireccion()
	var dirCamara=Vector3.ZERO	
	var camaraX=$ControlCamara/ControlHorizontal/ControlVertical/Camara.global_transform
	
	dirCamara -= camaraX.basis.z.normalized()*moverDir.x
	dirCamara += camaraX.basis.x.normalized()*moverDir.y
	
	movJugador=dirCamara
	
	move_and_slide(movJugador * avance,up)
	
func moverDosDireccion():	
	var x=Input.get_action_strength("Adelante")-Input.get_action_strength("Atras")
	var y=Input.get_action_strength("Derecha")-Input.get_action_strength("Izquierda")
		
	var movDir=Vector2(x,y)
	
	if not movDir== Vector2.ZERO:
			moverCaraTree(x,y)
	return movDir.normalized()	


func moverCaraTree(x,z):
	rotation.y=atan2(x,z-PI*2)
	
func animacionTree():
	if (movJugador*avance).length()>minBlendSpeed:
		moverEstado+=blendCorrer
	else:
		moverEstado-=blendIniciar
		
		
	moverEstado=clamp(moverEstado,0,1)	
	var animacionJ=$Animated_Human/AnimationTree
	animacionJ["parameters/Mover/blend_amount"]=moverEstado
