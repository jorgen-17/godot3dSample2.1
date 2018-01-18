extends Spatial

var MOVE_FORWARD = "move_forward"
var MOVE_BACK = "move_back"
var RUN_FORWARD = "runForward"
var RUNNING_DISPLACEMENT_PER_SECOND = 50
var ANIMATION_PLAYER_INDEX = 1
var RUN_ANIMATION_SPEED = 2
var _forward = Vector3(0, 0, 1)
var _animPlayer

func _ready():
	set_process(true)
	self._animPlayer = self.get_child(ANIMATION_PLAYER_INDEX)
	self._animPlayer.set_current_animation(RUN_FORWARD)
	self._animPlayer.set_speed(RUN_ANIMATION_SPEED)

func _process(delta):
	if(Input.is_action_pressed(MOVE_FORWARD)):
		print("w pressed")
		var displacement = RUNNING_DISPLACEMENT_PER_SECOND * delta
		self.translate(displacement * _forward)
		self._animPlayer.advance(delta)
	elif(Input.is_action_pressed(MOVE_BACK)):
		print("s pressed")
		var displacement = -RUNNING_DISPLACEMENT_PER_SECOND * delta
		self.translate(displacement * _forward)
		self._animPlayer.advance(-delta)
	else:
	 	print("else");
	# 	self._animPlayer.stop();
		#else if(Input.IsActionJustReleased(MOVE_BACK))
#    {
#        this._animPlayer.Seek(0, true)
#    }
