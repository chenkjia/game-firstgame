extends Area2D

@export var slime_speed: float = -100
@export var is_dead: bool = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if not is_dead:
		position +=Vector2(slime_speed,0) * delta
	if position.x < -300:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D and not is_dead:
		body.game_over()
	pass # Replace with function body.


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullet"):
		is_dead = true
		$AnimatedSprite2D.play("death")
		area.queue_free()
		get_tree().current_scene.score += 1
		$DeadSound.play()
		await get_tree().create_timer(0.6).timeout
		queue_free()
	pass # Replace with function body.
