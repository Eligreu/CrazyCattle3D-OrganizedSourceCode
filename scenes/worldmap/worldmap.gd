extends Node2D

func _button_pressed(_button: Button) -> void:
	$Worldmap / Uirelease.play()
	print(_button.name)
	get_tree().change_scene_to_file("res://levels/"+_button.name+"/scene.tscn")
func _button_down(_button: Button) -> void:
	$Worldmap / Uipress.play()
func _button_mouse_entered(_button: Button) -> void:
	if _button.disabled == false:
		$Worldmap / Uihover.play()
func _on_especialbutton_pressed(_button) -> void :
	$Worldmap / Uirelease.play()
	if _button.name == "returnn":
		get_tree().change_scene_to_file("res://scenes/menu/menu.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/trophyroom/trophyroom.tscn")

func updateUnlocks():
	for levelname in Global.unlockedlevels:
		var _button = $Worldmap.get_node(levelname)
		_button.disabled = false
func updateBeatens():
	for levelname in Global.beatenlevels:
		var _button = $Worldmap.get_node(levelname)
		_button.get_node("check").visible = true

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	updateUnlocks()
	updateBeatens()
	var coiso = $Worldmap / returnn
	for i in range(0,2,1):
		coiso.pressed.connect(_on_especialbutton_pressed.bind(coiso))
		coiso.button_down.connect(_button_down.bind(coiso))
		coiso.mouse_entered.connect(_button_mouse_entered.bind(coiso))
		coiso = $Worldmap / trophyroom
	for button in $Worldmap.get_children():
		if button.is_class("Button") and (button.name != 'returnn' and button.name != 'trophyroom'):
			button.pressed.connect(_button_pressed.bind(button))
			button.button_down.connect(_button_down.bind(button))
			button.mouse_entered.connect(_button_mouse_entered.bind(button))
