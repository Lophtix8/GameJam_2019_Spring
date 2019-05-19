extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var locations = [Vector2(2.5*64, 4*64), Vector2(4.5*64,2*64), Vector2(4.5*64, 6*64), Vector2(7.5*64, 1*64), 
				Vector2(7.5*64, 7*64), Vector2(11.5*64, 2*64), Vector2(11.5*64, 6*64), Vector2(13.5*64, 4*64)]
# Called when the node enters the scene tree for the first time.
func _ready():
	var saw_location = preload("res://Scenes/Saw.tscn")
	for location in locations:
		var saw = saw_location.instance()
		saw.position = location
		self.add_child(saw)
	print("ran")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
