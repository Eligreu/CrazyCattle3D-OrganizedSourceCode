extends Node2D


func updateTrophies():
	if Global.beatenlevels.size() >= 1:
		$one.show()
		if Global.beatenlevels.size() >= 2:
			$two.show()
			if Global.beatenlevels.size() >= 3:
				$three.show()
				$return2.show()

func _ready():
	$Panel / AnimationPlayer.play("fadein")
	updateTrophies()
func _on_return_pressed() -> void :
	$Uirelease.play()
	get_tree().change_scene_to_file("res://scenes/worldmap/worldmap.tscn")
func _on_return_button_down() -> void :
	$Uipress.play()
func _on_return_mouse_entered() -> void :
	$Uihover.play()


func _on_return_2_pressed() -> void :
	get_tree().change_scene_to_file("res://scenes/credits/credits.tscn")
