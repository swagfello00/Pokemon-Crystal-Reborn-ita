	object_const_def
	const POKESEERSHOUSE_GRANNY

PokeSeersHouse_MapScripts:
	def_scene_scripts

	def_callbacks

SeerScript:
	faceplayer
	opentext
	loadmem wBuffer1, 0
	special PokeSeer
	waitbutton
	loadmem wSeerCaughtLevel, 0
	setval TOWN_MAP
	special UnusedFindItemInPCOrBag
	iftrue .skip
	readmem wBuffer1
	ifequal 100, .TownMap
.skip
	closetext
	end

.TownMap
	writetext TownMapText
	waitbutton
	verbosegiveitem TOWN_MAP
	closetext
	end
	
TownMapText:
	text "Ti regalo la mia"
	line "MAPPA CITTÀ."
	
	para "Te la meriti."
	done

PokeSeersHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CIANWOOD_CITY, 7
	warp_event  3,  7, CIANWOOD_CITY, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SeerScript, -1
