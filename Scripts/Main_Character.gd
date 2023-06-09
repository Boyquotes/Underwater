extends CharacterBody2D

var screen_size
var lin_vel = Vector2.ZERO
@export var speed = 3
const JUMP = 300
const WEIGHT = 10
const UP = Vector2(0, -1)
var hp = 100
var h2o = 100

func _ready():
	screen_size = get_viewport_rect().size
	
func apply_gravity():
	if is_on_floor():
		lin_vel.y = 0
	else:
		lin_vel.y += WEIGHT
  
func jump():
	if Input.is_action_pressed("move_up") and is_on_floor():
		lin_vel.y -= JUMP
	
#func suffocate():
#	if h2o == 0:
#		visible = false


func physic():
	apply_gravity()
	move()
	jump()
	move_and_slide()

func move():
	if Input.is_action_pressed("move_left") and not Input.is_action_pressed("move_right"):
		lin_vel.x += -speed
		if Input.is_action_just_pressed("Dash"):
			position.x = position.x - 150
			h2o -= 5
	elif Input.is_action_pressed("move_right") and not Input.is_action_pressed("move_left"):
		lin_vel.x += speed
		if Input.is_action_just_pressed("Dash"):
			position.x = position.x + 150
			h2o -= 5
	#elif Input.is_action_pressed("move_up") and not Input.is_action_pressed("move_down"):
		#lin_vel.y -= speed
	#elif Input.is_action_pressed("move_up") and not Input.is_action_pressed("move_down"):
		#lin_vel.y -= speed
	else: 
		lin_vel.x = 0

func _process(delta):
	physic()
	position += lin_vel * delta
	#position.x = clamp(position.x, 0, screen_size.x)
	if lin_vel.x != 0:
		$Sprite2D.flip_v = false
		$Sprite2D.flip_h = lin_vel.x < 0
	



