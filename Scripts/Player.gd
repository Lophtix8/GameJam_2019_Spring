extends RigidBody2D

var movement = 100
var deadzone = 0.5

var hp = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.connect("joy_connection_changed",self,"joy_con_changed")
	self.mode = MODE_CHARACTER
	self.linear_damp = 0.5
	self.mass = 10
	
func _physics_process(delta):
	self.gravity_scale = 0
	
	if self.linear_velocity.length() <= (1.5*movement) and self.applied_force.length() == 0:
		self.linear_velocity = get_input()

func get_input():
	var motion = Vector2(0,0)
	if Input.get_connected_joypads().size() > 0:
		var axesM = [0,0]
		var axesD = [0,0]
		motion.x = Input.get_joy_axis(0,JOY_ANALOG_LX)
		motion.y = Input.get_joy_axis(0,JOY_ANALOG_LY)
		
		if motion.length() < deadzone:
			motion *= 0
		
	return motion*movement
	
func hit(dir):
	hp -= 10 
	self.linear_velocty = Vector2(0,0)
	self.apply_central_impulse(dir*100*1/hp)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
