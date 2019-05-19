extends Camera2D

var zoom_factor = 500
var pos_mid = 0
var players = []
var pos_dif = 1
var zoomMax = 1
var zoomMin = 0.5

# Called when the node enters the scene tree for the first time.
func _ready():
	players = self.get_parent().get_children()
	

func _physics_process(delta):
	if players != []:
		pos_mid = (players[0].position + players[1].position)/2
		pos_dif = (players[0].position - players[1].position).length()
		self.position = pos_mid
		var zoom_factor = pos_dif*2/(get_viewport().get_visible_rect().size.x)
		
		if zoom_factor < zoomMax and zoom_factor > zoomMin:
			self.zoom = Vector2(zoom_factor, zoom_factor)
		elif zoom_factor > zoomMax:
			self.zoom = Vector2(zoomMax, zoomMax)
		elif zoom_factor < zoomMin:
			self.zoom = Vector2(zoomMin, zoomMin)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
