extends CharacterBody3D

@export var box: PackedScene
const SPEED = 10.0
const JUMP_VELOCITY = 4.5
var xdir = 0
var ydir = 0
var zdir = 0
var cd
var x = 0
var y = 0
var z = 0
var new_move = true
var reset = false


# Get the gravity from the project settings to be synced with RigidBody nodes.


func _physics_process(delta):
	# Add the gravity.
	if !cd:
		new_move = true
		move_body()
		var temp = box.instantiate()
		temp.position = position
		position += Vector3(zdir, ydir, xdir)
		if Variables.length != 0: %body.add_child(temp)
		cool_down()


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir_rl = Input.get_axis("ui_up", "ui_down")
	var input_dir_fb = Input.get_axis("ui_left", "ui_right")
	var input_dir_ud = Input.get_axis("ydown", "yup")
	if input_dir_rl && xdir == 0 and new_move:
		new_move = false
		xdir = .5 * input_dir_rl
		ydir = 0
		zdir = 0
	if input_dir_fb && zdir == 0 and new_move:
		new_move = false
		xdir = 0
		ydir = 0
		zdir = .5 * input_dir_fb
	if input_dir_ud && ydir == 0 and new_move:
		new_move = false
		xdir = 0
		ydir = .5 * input_dir_ud
		zdir = 0
		
	if Input.is_action_just_pressed("ui_accept"):
		grow()
	move_and_slide()

func move_body():
	for child in %body.get_children():
		if child.has_method("kill"):
			child.kill()


func grow():
	for child in %body.get_children():
		if child.has_method("grow"):
			child.grow()
	Variables.add_length()


func cool_down():
	cd = true
	await get_tree().create_timer(.2).timeout
	cd = false


func _on_area_3d_body_entered(body):
	if body.get_name() == "bill":
		Variables.reset()
		get_tree().reload_current_scene()
