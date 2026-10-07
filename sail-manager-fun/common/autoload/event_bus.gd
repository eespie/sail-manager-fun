extends Node

# System
@warning_ignore("unused_signal") signal sigChangeScene(scene :String)
@warning_ignore("unused_signal") signal sigPause(is_paused : bool)

# HUD
@warning_ignore("unused_signal") signal sigPrepareContinue()

# State machine
@warning_ignore("unused_signal") signal sigEnterState(name : String)
@warning_ignore("unused_signal") signal sigExitState(name : String)

# Mouse
@warning_ignore("unused_signal") signal sigMouseDrag(pos :Vector2)
@warning_ignore("unused_signal") signal sigMouseButtonClicked(pos :Vector2)
@warning_ignore("unused_signal") signal sigMouseButtonReleased(pos :Vector2)

# Select team for new game
@warning_ignore("unused_signal") signal sigTeamSelected(_team_entity :TeamEntity)

# Select new_crew
@warning_ignore("unused_signal") signal sigCrewLineSelected(person : Dictionary)
@warning_ignore("unused_signal") signal sigCrewSelectionNeeded(crew_id :int, crew_role : CrewRole)
@warning_ignore("unused_signal") signal sigCrewHired(crew_id :int, person : Dictionary)


# Player
@warning_ignore("unused_signal") signal sigCurrentMoneyChanged(team_id : int, amount :int)
@warning_ignore("unused_signal") signal sigAddMoney(team_id : int, amount :int)
