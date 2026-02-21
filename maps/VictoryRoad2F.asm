	object_const_def
	const VICTORYROAD2F_MOLTRES
	const VICTORYROAD2F_POKE_BALL6

VictoryRoad2F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .ResetWarp

.ResetWarp
	loadmem wDigWarpNumber, 3
	endcallback

MoltresFight:
	loadmem wBuffer1, 0
	faceplayer
	opentext
	writetext VictoryRoadMoltresText
	pause 15
	cry MOLTRES
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_SUICUNE
	loadwildmon MOLTRES, 50
	startbattle
	disappear VICTORYROAD2F_MOLTRES
	reloadmapafterbattle
	readmem wBuffer1
	ifnotequal MOLTRES, .end
	setevent EVENT_CAUGHT_MOLTRES
.end
	end

VictoryRoadTM38:
	itemball TM_FIRE_BLAST

VictoryRoadMoltresText:
	text "Gyaooh!"
	done

VictoryRoad2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  6, ROUTE_23, 5
	warp_event  3,  6, ROUTE_23, 6
	warp_event  2,  7, ROUTE_23, 7
	warp_event  3,  7, ROUTE_23, 8
	warp_event  7,  7, VICTORY_ROAD, 11

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  2, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MoltresFight, EVENT_VICTORY_ROAD_MOLTRES
	object_event  7,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadTM38, EVENT_VICTORY_ROAD_TM_FIRE_BLAST