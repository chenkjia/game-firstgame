extends Node2D

@export var slime_scene: PackedScene
@export var spawn_timer: Timer

func _process(delta: float) -> void:
	spawn_timer.wait_time -= 0.2 * delta
	spawn_timer.wait_time = clamp(spawn_timer.wait_time, 1, 3)

func _spawn_slime() -> void:
	var slime_node = slime_scene.instantiate()
	slime_node.position = Vector2(260, randf_range(50,115))
	get_tree().current_scene.add_child(slime_node)
