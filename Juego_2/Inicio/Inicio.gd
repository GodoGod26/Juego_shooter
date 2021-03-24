extends CanvasLayer



func _on_Instrucciones_pressed():
	get_tree().change_scene("res://Inicio/Control_Instrucciones.tscn")
	

func _on_Salir_pressed():
	get_tree().quit()


func _on_Siguiente_pressed():
	get_tree().change_scene("res://Inicio/Escena_juego.tscn")
