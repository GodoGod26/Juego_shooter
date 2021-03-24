extends StaticBody
var puntos = 0


func _on_Area_body_entered(body):
	puntos=puntos+100
	print("Le diste!, tu puntaje ahora es: ",puntos)


