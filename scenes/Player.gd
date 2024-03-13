extends KinematicBody2D

func _ready():
	pass

export (int) var speed = 400
export (int) var jump_speed = -400
export (int) var dash_speed = 10000
export (int) var sprint_speed = 600
export (int) var GRAVITY = 1200

export (bool) var canDoubleJump = false

const UP = Vector2(0,-1)
const crouch_offset = Vector2(0, 5)

var velocity = Vector2()
var last_movement_input_time = 25
var score = 0
var dash_timeout = 100

func _on_coin_collected():
	score += 1
	update_hud()
	
func update_hud():
	var hud_label = get_node("/root/CanvasLayer")
	hud_label.text = "Score: " + str(score)

func get_input():
	velocity.x = 0
	if Input.is_action_pressed('ui_right'):
		$Sprite.play("jalan_kanan")
		$Sprite.flip_h = false
		if can_dash() and dash_timeout == 100:
			print("dashed right")
			velocity.x += dash_speed
			dash_timeout = 0
			
		else:
			velocity.x += speed
			last_movement_input_time = 0

	elif Input.is_action_pressed('ui_left'):
		$Sprite.play("jalan_kanan")
		$Sprite.flip_h = true
		if can_dash() and dash_timeout == 100:
			print("dashed left")
			velocity.x -= dash_speed
			dash_timeout = 0
			
		else:
			velocity.x -= speed
			last_movement_input_time = 0
	
	else:
		$Sprite.play("idle")
		

	if is_on_floor() and Input.is_action_pressed("ui_jump"):
		$Sprite.play("lompat_kanan")
		$Sprite.flip_h = false
		velocity.y = jump_speed
		canDoubleJump = true
		print("can double jump")

	if velocity.y >= 1/3*jump_speed and canDoubleJump and Input.is_action_pressed("ui_jump"):
		$Sprite.play("lompat_kanan")
		$Sprite.flip_h = false
		print("double jumped")
		velocity.y = jump_speed*1.5
		canDoubleJump = false

	if Input.is_action_pressed("ui_down"):
		scale = Vector2(1, 0.5)
		position += crouch_offset
		speed = 200
	else:
		scale = Vector2(1, 1)
		speed = 400
		
	if Input.is_action_pressed("ui_sprint"):
		print("sprinting")
		speed = sprint_speed
	else:
		speed = 400

func can_dash():
	return last_movement_input_time < 7 and last_movement_input_time > 1

func _physics_process(delta):
	velocity.y += delta * GRAVITY
	last_movement_input_time += 1
	if dash_timeout < 100:
		dash_timeout += 1
	get_input()
	velocity = move_and_slide(velocity, UP)
