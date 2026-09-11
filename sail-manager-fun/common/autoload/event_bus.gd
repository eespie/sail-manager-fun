extends Node

# System
@warning_ignore("unused_signal") signal sigChangeScene(scene :String)
@warning_ignore("unused_signal") signal sigPause(is_paused : bool)

# State machine
@warning_ignore("unused_signal") signal sigEnterState(name : String)
@warning_ignore("unused_signal") signal sigExitState(name : String)

# Mouse
@warning_ignore("unused_signal") signal sigMouseDrag(pos :Vector2)
@warning_ignore("unused_signal") signal sigMouseButtonClicked(pos :Vector2)
@warning_ignore("unused_signal") signal sigMouseButtonReleased(pos :Vector2)

# Console
@warning_ignore("unused_signal") signal sigConsoleAddCommand(id: int, color: Color, description: String, command: String, post_desc: String, sig: Signal)
@warning_ignore("unused_signal") signal sigConsoleRemoveCommand(id :int)
@warning_ignore("unused_signal") signal sigConsoleEnableCommand(enabled: bool, id :int)


# Command
@warning_ignore("unused_signal") signal sigCommandNone(id: int)
@warning_ignore("unused_signal") signal sigCommandTaxi(id: int)
@warning_ignore("unused_signal") signal sigCommandTakeoff(id: int)
@warning_ignore("unused_signal") signal sigCommandFlightPlan(id: int)
@warning_ignore("unused_signal") signal sigCommandCrossRunway(id: int)
@warning_ignore("unused_signal") signal sigCommandPrepareLanding(id: int)
