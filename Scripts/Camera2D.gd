extends Camera2D

var zoom_factor = 500
var pos_mid = 0
var players = []
var pos_dif = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	players = self.get_parent().get_children()
	

func _physics_process(delta):
	if players != []:
		pos_mid = (players[0].position + players[1].position)/2
		pos_dif = (players[0].position - players[1].position).length()
		self.position = pos_mid
		self.zoom = Vector2(pos_dif/zoom_factor, pos_dif/zoom_factor)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
