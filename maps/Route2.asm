	object_const_def
	const ROUTE2_BUG_CATCHER1
	const ROUTE2_BUG_CATCHER2
	const ROUTE2_BUG_CATCHER3
	const ROUTE2_POKE_BALL1
	const ROUTE2_POKE_BALL2

Route2_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerBugCatcherRob:
	trainer BUG_CATCHER, ROB, EVENT_BEAT_BUG_CATCHER_ROB, BugCatcherRobSeenText, BugCatcherRobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherRobAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherEd:
	trainer BUG_CATCHER, ED, EVENT_BEAT_BUG_CATCHER_ED, BugCatcherEdSeenText, BugCatcherEdBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherEdAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherDoug:
	trainer BUG_CATCHER, DOUG, EVENT_BEAT_BUG_CATCHER_DOUG, BugCatcherDougSeenText, BugCatcherDougBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherDougAfterBattleText
	waitbutton
	closetext
	end

Route2Sign:
	jumptext Route2SignText

Route2DiglettsCaveSign:
	jumptext Route2DiglettsCaveSignText

Route2Carbos:
	itemball CARBOS

Route2Elixer:
	itemball ELIXER

BugCatcherRobSeenText:
	text "Ho dei forti #-"
	line "MON coleottero."
	cont "Preparati a"
	cont "perdere!"
	done

BugCatcherRobBeatenText:
	text "Che mazzata…"
	done

BugCatcherRobAfterBattleText:
	text "Devo cercare dei"
	line "#MON coleottero"
	cont "più forti."
	done

BugCatcherEdSeenText:
	text "Se vai nell'erba"
	line "alta in pantaloni"

	para "corti ti graffi,"
	line "sai?"
	done

BugCatcherEdBeatenText:
	text "Ahi, ahi, ahi!"
	done

BugCatcherEdAfterBattleText:
	text "Quando fai il"
	line "bagno fa ancora"
	cont "più male!"
	done

BugCatcherDougSeenText:
	text "Perché i #MON"
	line "coleottero non"
	cont "piacciono alle"
	cont "ragazze?"
	done

BugCatcherDougBeatenText:
	text "Niente da fare!"
	done

BugCatcherDougAfterBattleText:
	text "I #MON coleot-"
	line "tero squittiscono"

	para "come peluche"
	line "se gli si preme"
	cont "la pancia."

	para "Come mi piace!"
	done

Route2SignText:
	text "PERCORSO 2"

	para "SMERALDOPOLI -"
	line "PLUMBEOPOLI"
	done

Route2DiglettsCaveSignText:
	text "GROTTA DIGLETT"
	done

Route2_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15, 15, ROUTE_2_NUGGET_HOUSE, 1
	warp_event 15, 31, ROUTE_2_GATE, 3
	warp_event 16, 27, ROUTE_2_GATE, 1
	warp_event 17, 27, ROUTE_2_GATE, 2
	warp_event 12,  7, DIGLETTS_CAVE, 3
	warp_event  4, 31, ROUTE_2_SOUTH_GATE, 3
	warp_event  2,  9, ROUTE_2_NORTH_GATE, 1
	warp_event  3,  9, ROUTE_2_NORTH_GATE, 2

	def_coord_events

	def_bg_events
	bg_event  7, 51, BGEVENT_READ, Route2Sign
	bg_event 11,  9, BGEVENT_READ, Route2DiglettsCaveSign

	def_object_events
	object_event 10, 45, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 5, TrainerBugCatcherRob, -1
	object_event  6,  4, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherEd, -1
	object_event  0, 40, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherDoug, -1
	object_event 19,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route2Carbos, EVENT_ROUTE_2_CARBOS
	object_event 14, 50, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route2Elixer, EVENT_ROUTE_2_ELIXER
