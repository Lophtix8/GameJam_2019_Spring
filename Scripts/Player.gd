extends RigidBody2D

var movement = 100
var deadzone = 0.5

var hp = 1
var pol = 1
var change_sprite = false
onready var selected = $Down
onready var graphics = [$Up,$Sides_up,$Sides,$Sides_down,$Down]
 
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.connect("joy_connection_changed",self,"joy_con_changed")
	self.mode = MODE_CHARACTER
	self.linear_damp = 10
	self.mass = 10
	
func _physics_process(delta):
	self.gravity_scale = 0
	
	if self.linear_velocity.length() <= (1.1*movement) and self.applied_force.length() == 0:
		self.linear_velocity = get_input()

func get_input():
	change_sprite = true
	var motion = Vector2(0,0)
	if Input.get_connected_joypads().size() > 0:
		motion.x = Input.get_joy_axis(0,JOY_ANALOG_LX)
		motion.y = Input.get_joy_axis(0,JOY_ANALOG_LY)
		
		var sec_vec = motion
	
		sec_vec = sec_vec.rotated(PI/2)
			
		if sec_vec.y >0:
			pol = 1
		else:
			pol = -1
		
		if motion.length() < deadzone:
			motion *= 0
			change_sprite = false
		
		sec_vec.y = abs(sec_vec.y)
		for i in range(5):
			if sec_vec.angle() < PI/8 + i*PI/4:
				animation(i, change_sprite)
				break
		
		
	return motion.normalized()*movement
	
func hit(dir):
	hp -= 0.1
	self.linear_velocity = dir*movement+dir*30/hp
	if hp == 0:
		self.queue_free()
	
func animation(dir, chg_sprite):
	if not chg_sprite:
		selected.get_child(1).visible = false
		selected.get_child(0).visible = true
	else:
		self.selected = self.graphics[dir]
		selected.get_child(1).visible = true
		selected.get_child(1).transform.x.x = pol 
		selected.get_child(0).visible = false
		selected.get_child(0).transform.x.x = pol
		
	for sprite in self.graphics:
		if sprite != selected:
			sprite.get_child(1).visible = false
			sprite.get_child(0).visible = false
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
