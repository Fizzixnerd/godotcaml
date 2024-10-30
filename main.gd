extends Node2D

var c_
var succ
# Called when the node enters the scene tree for the first time.
func _ready():
	var c = MyClass.new()
	c.my_signal.connect(func (j): 
		print(succ.call(j))
		print("rawr!"))
	self.add_child(c)
	c.set_process(true)
	self.set_process(true)
	c_ = c
	succ = c_.succ_by(3)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#c_._process(delta)
	c_.my_signal.emit(7)
