extends Sprite
# Declare member variables here. Examples:

var dir = Vector2(1,0)
var rad = 10
var bullet_speed = 60
var dead_zone = 0.2

var cur_state = false
var prev_state = false

var bullet_scene = preload("res://Scenes/Bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	self.position = dir.normalized()*rad
	pass # Replace with function body.
	
func _physics_process(delta):
	dir.x = Input.get_joy_axis(0, JOY_ANALOG_RX)
	dir.y = Input.get_joy_axis(0, JOY_ANALOG_RY)
	
	if dir.length() > dead_zone:
		self.position = dir.normalized()*rad
	
	cur_state = Input.is_joy_button_pressed(0,JOY_BUTTON_5)
	
	if cur_state and not prev_state:
		var bullet = bullet_scene.instance()
		for bullet_kin in bullet.get_children():
			bullet_kin.pos = self.position*1.8 + self.get_parent().position
			bullet_kin.dir = self.position
		
		self.get_parent().get_parent().add_child(bullet)
	
	prev_state = cur_state
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
