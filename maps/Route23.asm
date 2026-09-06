Route23_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route23FlypointCallback

Route23FlypointCallback:
	setflag ENGINE_FLYPOINT_INDIGO_PLATEAU
	endcallback

IndigoPlateauSign:
	jumptext IndigoPlateauSignText

Route23MetalPowder:
	itemball METAL_POWDER

IndigoPlateauSignText:
	text "ALTOPIANO BLU"

	para "L'obiettivo ultimo"
	line "degli allenatori!"

	para "SEDE CENTRALE"
	line "LEGA #MON"
	done

Route23_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  5, INDIGO_PLATEAU_POKECENTER_1F, 1
	warp_event 10,  5, INDIGO_PLATEAU_POKECENTER_1F, 2
	warp_event  9, 13, VICTORY_ROAD, 10
	warp_event 10, 13, VICTORY_ROAD, 10
	warp_event  6, 16, VICTORY_ROAD_2F, 1
	warp_event  7, 16, VICTORY_ROAD_2F, 2
	warp_event  6, 17, VICTORY_ROAD_2F, 3
	warp_event  7, 17, VICTORY_ROAD_2F, 4

	def_coord_events

	def_bg_events
	bg_event 11,  7, BGEVENT_READ, IndigoPlateauSign

	def_object_events
	object_event  1, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route23MetalPowder, EVENT_ROUTE_23_METAL_POWDER