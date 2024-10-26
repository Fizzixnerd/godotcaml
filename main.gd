extends Node2D

var c_
var succ
# Called when the node enters the scene tree for the first time.
func _ready():
	var c = MyClass.new()
	self.add_child(c)
	c.set_process(true)
	self.set_process(true)
	c_ = c
	succ = c_.succ_by(3)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#c_._process(delta)
	print(succ.call(7))
