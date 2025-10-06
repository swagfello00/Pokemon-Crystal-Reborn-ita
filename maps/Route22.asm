	object_const_def
	const ROUTE22_POKE_BALL1

Route22_MapScripts:
	def_scene_scripts

	def_callbacks

VictoryRoadEntranceSign:
	jumptext VictoryRoadEntranceSignText

Route22Twistedspoon:
	itemball TWISTEDSPOON

VictoryRoadEntranceSignText:
	text "LEGA #MON"

	para "VIA VITTORIA"
	line "INGRESSO"
	done

Route22_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13,  5, VICTORY_ROAD_GATE, 1

	def_coord_events

	def_bg_events
	bg_event 15,  7, BGEVENT_READ, VictoryRoadEntranceSign

	def_object_events
	object_event 27, 7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route22Twistedspoon, EVENT_ROUTE_22_TWISTEDSPOON
