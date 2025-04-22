extends RichTextLabel
func _physics_process(_delta):
	text = "[pulse freq=1.0 color=#ffffff40 ease=-2.0]" + str(Global.global_sheep) + " remain."
