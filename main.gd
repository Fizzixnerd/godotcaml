extends Node2D

var player_sprite
# Called when the node enters the scene tree for the first time.
func _ready():
	player_sprite = PlayerSprite.new()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass