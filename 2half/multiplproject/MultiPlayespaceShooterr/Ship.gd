extends RigidBody2D

var speed = 20
var rotation_speed = 80
var max_speed = 25

slave var slave_position = Vector2()
slave var slave_rotation = 0

func _ready():
	pass

func _process(delta):
	if is_network_master():
		
		if Input.is_action_pressed("ui_up"):
			add_force(Vector2(0,0), Vector2(cos(rotation), sin(rotation))*speed)
		if get_linear_velocity().length()>max_speed:
			set_linear_velocity(get_linear_velocity().normalized()*max_speed)
		if Input.is_action_pressed("ui_left"):
			set_angular_velocity(-rotation_speed*delta)
		if Input.is_action_pressed("ui_right"):
			set_angular_velocity(rotation_speed*delta)
		rset_unreliable("slave_position", position)
		rset_unreliable("slave_rotation", rotation)
	else:
		position = slave_position