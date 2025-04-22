extends Node

func initialise_game():
	if ResourceLoader.exists("user://crazycattle3dsavefile.tres") == true:
		print("Savefile Exists; Skipping Initialisation")
	else:
		var data = SaveData.new()
		data.savename = "Nardo Polo"
		data.saveunlockedlevels = Global.unlockedlevelsog
		data.mastervol = 0
		data.musicvol = 0
		data.beatenlevels = []
		ResourceSaver.save(data, "user://crazycattle3dsavefile.tres")
		print("Savefile not found; Initialising")

func loadData():
	var data = ResourceLoader.load("user://crazycattle3dsavefile.tres") as SaveData
	Global.unlockedlevels = data.saveunlockedlevels
	Global.playername = data.savename
	Global.beatenlevels = data.beatenlevels
	AudioServer.set_bus_volume_db(0, data.mastervol)
	AudioServer.set_bus_volume_db(1, data.musicvol)
	if data.fullscreen == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	if data.fullscreen == false:
		pass
		
	print("Loaded with name " + Global.playername + " and " + str(Global.unlockedlevels) + " unlocked levels")

func _ready():
	randomize()
	initialise_game()
	loadData()

func uiHover():
	$ng4.play()

func uiPress():
	$ng5.play()

func uiRelease():
	#hi, who is reading ts
	#yeah, ik theres an error here. but its harmless
	$ng6.play()

func _on_ng_pressed() -> void :
	$ng7.play()
	get_tree().change_scene_to_file("res://scenes/worldmap/worldmap.tscn")

func _on_opt_pressed() -> void :
	$ng7.play()
	get_tree().change_scene_to_file("res://scenes/options/options.tscn")

func _on_quit_pressed() -> void :
	$ng3.disabled = true
	$ng2.disabled = true
	$ng.disabled = true
	$ng7.pitch_scale = randf_range(0.7, 1.3)
	$ng7.play()

func _on_ng_mouse_entered() -> void :
	uiHover()
func _on_opt_mouse_entered() -> void :
	uiHover()
func _on_quit_mouse_entered() -> void :
	uiHover()

func _on_ng_button_up() -> void :
	uiRelease()
func _on_ng_button_down() -> void :
	uiPress()

func _on_opt_button_up() -> void :
	uiRelease()
func _on_opt_button_down() -> void :
	uiPress()
func _on_quit_button_down() -> void :
	uiPress()
func _on_quit_button_up() -> void :
	uiRelease()

func _on_baa_finished() -> void :
	get_tree().quit()
