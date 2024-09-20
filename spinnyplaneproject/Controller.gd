extends Node2D 

@export var rock_resource: PackedScene 
@export var rock_resource2: PackedScene
@onready var crash_sound = $Sound/thud
@onready var rock_timer = $RockTimer  

func _ready():
	rock_timer.wait_time = 0.5  
	rock_timer.start()  
	$GameOver.visible = false
	

func plane_hit():
	play_crash_sound()
	queue_free()
	$GameOver.visible = true
	$GameOver/AnimationPlayer.play("Slide_in")
	$RockTimer.stop()  

func _on_rock_timer_timeout():
	spawn_rock()

func spawn_rock():
	
	var position = Vector2.ZERO
	var position2 = Vector2.ZERO
	if randf() < 0.5:
		position2 = Vector2(randf_range(0, get_viewport().size.x), 0) 
	else:
		position = Vector2(randf_range(0, get_viewport().size.x), 550 )  

	var rock = rock_resource.instantiate()
	rock.position = position
	add_child(rock) 
	
	var upsideDownRock = rock_resource2.instantiate()
	upsideDownRock.position = position2
	add_child(upsideDownRock) 

func _process(delta):
	for rock in get_children():
		if rock is Node2D:
			rock.position.x -= 200 * delta 
			if rock.position.x < -50:  
				rock.queue_free() 

func _on_play_again_pressed() -> void:
	pass 

func play_crash_sound():
	var player = AudioStreamPlayer.new()  
	player.stream = crash_sound  
	get_tree().current_scene.add_child(player)  
	
