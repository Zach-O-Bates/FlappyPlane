extends Area2D

func _ready() -> void:
	self.position.x = 30

func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	var root = get_tree().root.get_node("spinnyplane")  
	root.plane_hit()  
	queue_free()  
