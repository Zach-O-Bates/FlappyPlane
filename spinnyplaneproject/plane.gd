extends RigidBody2D 

@onready var animated_sprite = $AnimatedSprite2D
var flap_strength = 400  

func _ready():
	pass

func _physics_process(delta):
	if Input.is_action_just_pressed("Flap"):
		flap()

func flap(): 
	linear_velocity = Vector2(0, -flap_strength)
	animated_sprite.play("Flap")


func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite.animation == "Flap":  
		animated_sprite.play("Glide")  
