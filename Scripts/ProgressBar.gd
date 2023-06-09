extends ProgressBar

@onready var player = $"../Main_Character"
@onready var timer = $Timer

func _ready():
	#timer.set_wait_time()
	timer.start()


func _process(delta):
	value = player.h2o
	


func _on_timer_timeout():
	player.h2o -= 0.1
