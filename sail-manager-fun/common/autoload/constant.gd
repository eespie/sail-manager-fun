extends Node
# class_name Constants

enum CREW_ROLE {
	DRIVER,
	STRATEGIST,
	WING_TRIMMER,
	FLIGHT_CONTROLLER,
	GRINDER,
	RESERVE,
	COACH,
	COACH_ASSISTANT
}

enum PERSON {
	ID,
	ROLE,
	NAME,
	NATIONALITY,
	REMAINING_YEARS,
	EXPERIENCE,
	SKILLS,
	ENDURANCE,
	ANNUAL_SALARY, 
	TEAM
}

enum TEAM_NAME {
	AUS,
	GBR,
	NZL,
	FRA,
	ESP,
	DEN,
	CAN,
	SUI,
	GER,
	NED,
	BRA,
	SWE
}

const FLAG_BY_COUNTRY : Dictionary = {
	'AUS': 'Flag_of_Australia.png',
	'GBR': 'Flag_of_the_United_Kindow.png',
	'NZL': 'Flag_of_New_Zealand.png',
	'FRA': 'Flag_of_France.png',
	'ESP': 'Flag_of_Spain.png',
	'DEN': 'Flag_of_Denmark.png',
	'CAN': 'Flag_of_Canada.png',
	'SUI': 'Flag_of_Switzerland.png',
	'GER': 'Flag_of_Germany.png',
	'NED': 'Flag_of_the_Netherlands.png',
	'BRA': 'Flag_of_Brazil.png',
	'SWE': 'Flag_of_Sweden.png',
	'USA': 'Flag_of_the_United_States.png',
}

enum RACE_TYPE {
	FLEET,
	FINAL,
	GRAND_FINAL
}
