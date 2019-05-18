extends KinematicBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.connect("joy_connection_changed",self,"joy_con_changed")
	
func _physics_process(delta):
	move_and_slide(get_input())

func get_input():
	var motion = Vector2(0,0)
	if Input.get_connected_joypads().size() > 0:
		var xAxis = Input.get_joy_axis(0,JOY_AXIS_7)
		var yAxis = Input.get_joy_axis(0,JOY_AXIS_6)
		motion.x = xAxis
		motion.y = yAxis
	return motion
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
