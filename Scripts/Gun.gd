extends Sprite
# Declare member variables here. Examples:

var dir = Vector2(1,0)
var rad = 15
var bullet_speed = 60
var dead_zone = 0.2

var cur_state = false
var prev_state = false
var chg_sprite = true

var bullet_scene = preload("res://Scenes/Bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	self.position = dir.normalized()*rad
	pass # Replace with function body.
	
func _physics_process(delta):
	chg_sprite = false
	dir.x = Input.get_joy_axis(0, JOY_ANALOG_RX)
	dir.y = Input.get_joy_axis(0, JOY_ANALOG_RY)
	
	if dir.length() > dead_zone:
		chg_sprite = true
		self.position = dir.normalized()*rad
	
	cur_state = Input.is_joy_button_pressed(0,JOY_BUTTON_5)
	
	if dir.x < 0 and chg_sprite:
		self.transform.x.x = -0.1
	elif chg_sprite:
		self.transform.x.x = 0.1
	
	if cur_state and not prev_state:
		var bullet = bullet_scene.instance()
		var bullet_kin = bullet.get_children()[0]
		bullet_kin.pos = self.position*2 + self.get_parent().position
		bullet_kin.dir = self.position
		
		self.get_parent().get_parent().add_child(bullet)
	
	prev_state = cur_state
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
