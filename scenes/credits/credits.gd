extends Node2D


func _on_return_button_down() -> void :
	$Uipress.play()
	get_tree().change_scene_to_file("res://scenes/trophyroom/trophyroom.tscn")
func _on_return_button_up() -> void :
	if is_inside_tree():
		$Uirelease.play()
func _on_return_mouse_entered() -> void :
	$Uihover.play()
