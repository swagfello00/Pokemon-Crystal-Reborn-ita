Route7_MapScripts:
	def_scene_scripts

	def_callbacks

Route7UndergroundPathSign:
	jumptext Route7UndergroundPathSignText

Route7LockedDoor:
	jumptext Route7LockedDoorText

Route7UndergroundPathSignText:
	text "C'è un volantino."

	para "… Alcuni"
	line "allenatori nella"

	para "VIA SOTTERRANEA"
	line "sono stati"
	cont "maleducati."

	para "A causa delle"
	line "lamentele dei"
	cont "residenti, la"
	cont "VIA SOTTERRANEA"
	cont "è stata chiusa."

	para "POLIZIA di"
	line "AZZURROPOLI"
	done

Route7LockedDoorText:
	text "È chiusa…"
	done

Route7_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15,  6, ROUTE_7_SAFFRON_GATE, 1
	warp_event 15,  7, ROUTE_7_SAFFRON_GATE, 2

	def_coord_events

	def_bg_events
	bg_event  5, 11, BGEVENT_READ, Route7UndergroundPathSign
	bg_event  6,  9, BGEVENT_READ, Route7LockedDoor

	def_object_events
