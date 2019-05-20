extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
var collision = []
# Called when the node enters the scene tree for the first time.
func _ready():
	self.mode = MODE_KINEMATIC
	self.contact_monitor = true
	self.contacts_reported = 3
	self.gravity_scale = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	self.get_child(0).rotate(PI/32)
	collision = get_colliding_bodies()
	if collision != []:
		for collider in collision:
			if collider.has_method("hit"):
				var dir = Vector2(0,0)
				if self.position.length() > collider.position.length():
					dir = (collider.position-self.position).normalized()
				else:
					dir = (self.position-collider.position).normalized()					
				collider.hit(dir*3)
