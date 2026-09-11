# Class to extend when implementing FSM states
class_name State
extends Node

var context : Node

func set_context(ctx : Node) -> void:
	context = ctx

func enter() -> void:
	pass
	
func exit() -> void:
	pass
	
## Return next state if change
func process_input(_event: InputEvent) -> State:
	return null
	
## Return next state if change
func process_physics(_delta: float) -> State:
	return null
	
## Return next state if change
func process_frame(_delta: float) -> State:
	return null
