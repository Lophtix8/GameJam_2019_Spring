extends RigidBody2D

# Declare member variables here. Examples:
var dir = Vector2()
var pos = Vector2()
var vel = 100
var collision = null
# Called when the node enters the scene tree for the first time.
func _ready():
	self.gravity_scale = 0
	self.position = pos
	self.linear_velocity = dir*vel
	self.contact_monitor = true
	self.contacts_reported = 3

func _physics_process(delta):
	collision = get_colliding_bodies()
	if collision != []:
		for collider in collision:
			if collider.has_method("hit"):
				collider.hit(dir)
		self.queue_free()
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
