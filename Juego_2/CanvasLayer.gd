extends CanvasLayer



func _on_volver_pressed():
	get_tree().change_scene("res://Inicio/Inicio.tscn")


func _on_Button_pressed():
	get_tree().quit()
