	object_const_def
	const SEAFOAM_ISLANDS_B4F_ARTICUNO
	const SEAFOAM_ISLANDS_B4F_POKE_BALL1
	const SEAFOAM_ISLANDS_B4F_POKE_BALL2

SeafoamIslandsB4F_MapScripts:
	def_scene_scripts

	def_callbacks

ArticunoFight:
	loadmem wBuffer1, 0
	faceplayer
	opentext
	writetext Route20ArticunoText
	pause 15
	cry ARTICUNO
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_SUICUNE
	loadwildmon ARTICUNO, 50
	startbattle
	disappear SEAFOAM_ISLANDS_B4F_ARTICUNO
	reloadmapafterbattle
	readmem wBuffer1
	ifnotequal ARTICUNO, .end
	setevent EVENT_CAUGHT_ARTICUNO
.end
	end

SeafoamIslandsB4FTM14:
	itemball TM_BLIZZARD

SeafoamIslandsB4FUltraBall:
	itemball ULTRA_BALL

Route20ArticunoText:
	text "Gyaooh!"
	done

SeafoamIslandsB4F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  3, SEAFOAM_ISLANDS_B3F, 5
	warp_event 27,  2, SEAFOAM_ISLANDS_B3F, 6
	warp_event 25,  7, SEAFOAM_ISLANDS_B3F, 7
	warp_event  7, 11, SEAFOAM_ISLANDS_B3F, 8
	warp_event 31, 13, SEAFOAM_ISLANDS_B3F, 9
	warp_event 37, 13, SEAFOAM_ISLANDS_B3F, 10

	def_coord_events

	def_bg_events

	def_object_events
	object_event 22, 13, SPRITE_ARTICUNO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ArticunoFight, EVENT_ROUTE_20_ARTICUNO
	object_event 23,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SeafoamIslandsB4FUltraBall, EVENT_SEAFOAM_ISLANDS_B4F_ULTRA_BALL
	object_event 33,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SeafoamIslandsB4FTM14, EVENT_SEAFOAM_ISLANDS_B4F_TM_BLIZZARD