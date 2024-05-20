extends Node2D

@onready var game_over_timer = $GameOverTimer

func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	
func spawn_tree():
	var new_tree = preload("res://pine_tree.tscn").instantiate()
	%TreePathFollow2D.progress_ratio = randf()
	new_tree.global_position = %TreePathFollow2D.global_position
	add_child(new_tree)


func _on_timer_timeout():
	spawn_mob()


func _on_player_health_depleted():
	%GameOver.visible = true
	get_tree().paused = false
	game_over_timer.start()
	


func _on_game_over_timer_timeout():
	%GameOver.visible = false
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_tree_spawn_timer_timeout():
	spawn_tree()
