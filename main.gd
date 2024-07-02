extends Node2D

var c_
# Called when the node enters the scene tree for the first time.
func _ready():
	var c = MyClass.new()
	self.add_child(c)
	c.set_process(true)
	self.set_process(true)
	c_ = c
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(MyClass.new())
	pass
