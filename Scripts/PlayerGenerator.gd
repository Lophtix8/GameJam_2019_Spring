extends Node2D

var locations = [Vector2(4*64, 4.5*64), Vector2(10*64, 4.5*64)]

# Called when the node enters the scene tree for the first time.
func _ready():
	var player_scene = preload("res://Prefabs/Player.tscn") 
	for i in range(2):
		var player = player_scene.instance()
		player.position = locations[i]
		player.controller = i
		self.add_child(player)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
