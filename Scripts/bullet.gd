extends KinematicBody2D

# Declare member variables here. Examples:
var dir = Vector2()
var pos = Vector2()
var vel = 2
# Called when the node enters the scene tree for the first time.
func _ready():
	self.position = pos

func _physics_process(delta):
	var collision = move_and_collide(dir*vel)
	if collision != null:
		if collision.collider.has_method("hit"):
			print("done")
			collision.collider.hit(dir)
		self.queue_free()
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
