RocketHideoutElevator_MapScripts:
	def_scene_scripts

	def_callbacks

RocketHideoutElevatorScript:
	opentext
	elevator RocketHideoutElevatorData
	closetext
	iffalse .Done
	pause 5
	playsound SFX_ELEVATOR
	earthquake 60
	waitsfx
.Done
	end

RocketHideoutElevatorData:
	db 3 ; floors
	elevfloor FLOOR_B1F, 5, ROCKET_HIDEOUT_B1F
	elevfloor FLOOR_B2F, 5, ROCKET_HIDEOUT_B2F
	elevfloor FLOOR_B4F, 3, ROCKET_HIDEOUT_B4F
	db -1 ; end

RocketHideoutElevator_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  0, ROCKET_HIDEOUT_B1F, -1

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, RocketHideoutElevatorScript

	def_object_events
