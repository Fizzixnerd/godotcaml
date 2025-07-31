extends AnimatedSprite2D

var speed = 200.0

func _ready():
	print("GDScript Player ready")
	position = Vector2(576, 324)
	visible = true
	play("default")

func _process(delta):
	var velocity = Vector2.ZERO
	
	if Input.is_key_pressed(KEY_W):
		velocity.y -= 1
	if Input.is_key_pressed(KEY_S):
		velocity.y += 1
	if Input.is_key_pressed(KEY_A):
		velocity.x -= 1
	if Input.is_key_pressed(KEY_D):
		velocity.x += 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	position += velocity * delta
	
	# Keep on screen
	position.x = clamp(position.x, 50, 1102)
	position.y = clamp(position.y, 50, 598)