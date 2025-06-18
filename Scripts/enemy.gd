extends Area2D

@export var slime_speed: float = -100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position +=Vector2(slime_speed,0) * delta
	pass


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.game_over()
	pass # Replace with function body.
