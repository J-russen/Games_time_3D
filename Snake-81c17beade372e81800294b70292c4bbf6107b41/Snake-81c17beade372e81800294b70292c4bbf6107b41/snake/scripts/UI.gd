extends CanvasLayer

var cur = "s"
# Called when the node enters the scene tree for the first time.
func _ready():
	$Title_And_Buttons/VBoxContainer/MarginContainer3/play_button.grab_focus()
	$Title_And_Buttons/VBoxContainer/MarginContainer3/play_button.text = "[START]"
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _input(event):
	if Input.is_key_pressed(KEY_DOWN):
		#if cur == "e":
			#$Title_And_Buttons/VBoxContainer/MarginContainer3/play_button.text = "[START]"
			#$Title_And_Buttons/VBoxContainer/MarginContainer/quit_button.text = "QUIT"
			#
		if cur == "s":
			$Title_And_Buttons/VBoxContainer/MarginContainer3/play_button.text = "START"
			$Title_And_Buttons/VBoxContainer/MarginContainer/quit_button.text = "[QUIT]"
			cur = "e"
	if Input.is_key_pressed(KEY_UP):
		if cur == "e":
			$Title_And_Buttons/VBoxContainer/MarginContainer3/play_button.text = "[START]"
			$Title_And_Buttons/VBoxContainer/MarginContainer/quit_button.text = "QUIT"
			cur = "s"
	if Input.is_action_just_pressed("ui_accept"):
		if cur == "s":
			get_tree().change_scene_to_file("res://scenes/Snake.tscn")
			print("Wahoo")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

