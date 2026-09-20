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

# Select team for new game
@warning_ignore("unused_signal") signal sigTeamSelected(team_info :TeamRes)

# Select new_crew
@warning_ignore("unused_signal") signal sigCrewSelected(id :int)


# Player
@warning_ignore("unused_signal") signal sigCurrentMoneyChanged(amount :int)
@warning_ignore("unused_signal") signal sigAddMoney(amount :int)
