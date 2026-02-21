	object_const_def
	const SIlVERCAVEOUTSIDE_POKE_BALL1
	const SIlVERCAVEOUTSIDE_POKE_BALL2
	const SIlVERCAVEOUTSIDE_POKE_BALL3

SilverCaveOutside_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, SilverCaveOutsideFlypointCallback

SilverCaveOutsideFlypointCallback:
	setflag ENGINE_FLYPOINT_SILVER_CAVE
	endcallback

MtSilverPokecenterSign:
	jumpstd PokecenterSignScript

MtSilverSign:
	jumptext MtSilverSignText

SilverCaveOutsideHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_SILVER_CAVE_OUTSIDE_HIDDEN_FULL_RESTORE

SilverCaveOutsideBrightPowder:
	itemball BRIGHTPOWDER

SilverCaveOutsideSilverLeaf:
	itemball SILVER_LEAF

SilverCaveOutsideGoldLeaf:
	itemball GOLD_LEAF

MtSilverSignText:
	text "MONTE ARGENTO"
	done

SilverCaveOutside_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 23, 19, SILVER_CAVE_POKECENTER_1F, 1
	warp_event 18, 11, SILVER_CAVE_ROOM_1, 1

	def_coord_events

	def_bg_events
	bg_event 24, 19, BGEVENT_READ, MtSilverPokecenterSign
	bg_event 17, 13, BGEVENT_READ, MtSilverSign
	bg_event  9, 25, BGEVENT_ITEM, SilverCaveOutsideHiddenFullRestore

	def_object_events
	object_event  1,  0, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveOutsideBrightPowder, EVENT_SILVER_CAVE_OUTSIDE_BRIGHTPOWDER
	object_event 36, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveOutsideSilverLeaf, EVENT_SILVER_CAVE_OUTSIDE_SILVER_LEAF
	object_event 17, 31, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveOutsideGoldLeaf, EVENT_SILVER_CAVE_OUTSIDE_GOLD_LEAF