	object_const_def
	const BATTLETOWEROUTSIDE_STANDING_YOUNGSTER
	const BATTLETOWEROUTSIDE_BEAUTY
	const BATTLETOWEROUTSIDE_SAILOR
	const BATTLETOWEROUTSIDE_LASS

BattleTowerOutside_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .Flypoint
	callback MAPCALLBACK_OBJECTS, BattleTowerOutsideShowCiviliansCallback

.Flypoint:
	setflag ENGINE_FLYPOINT_BATTLE_TOWER
	return

BattleTowerOutsideShowCiviliansCallback:
	special Mobile_DummyReturnFalse
	iffalse .nomobile
	clearevent EVENT_BATTLE_TOWER_OPEN_CIVILIANS

.nomobile
	endcallback

BattleTowerOutsideYoungsterScript:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer BattleTowerOutsideYoungsterText_NotYetOpen

.mobile
	jumptextfaceplayer BattleTowerOutsideYoungsterText_Mobile

BattleTowerOutsideBeautyScript:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer BattleTowerOutsideBeautyText_NotYetOpen

.mobile
	jumptextfaceplayer BattleTowerOutsideBeautyText

BattleTowerOutsideSailorScript:
	jumptextfaceplayer BattleTowerOutsideSailorText_Mobile

BattleTowerOutsideSign:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptext BattleTowerOutsideSignText_NotYetOpen

.mobile
	jumptext BattleTowerOutsideSignText

BattleTowerOutsideDoor:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptext BattleTowerOutsideText_DoorsClosed

.mobile
	jumptext BattleTowerOutsideText_DoorsOpen

BattleTowerOutsideYoungsterText_NotYetOpen: ; unreferenced
	text "Wow, la TORRE"
	line "LOTTA è enorme!"

	para "Ho il torcicollo a"
	line "guardarla."
	done

BattleTowerOutsideYoungsterText_Mobile: ; unreferenced
	text "Wow, la TORRE"
	line "LOTTA è enorme!"

	para "Siccome dentro ci"
	line "sono un sacco di"

	para "allenatori, ci"
	line "devono essere"

	para "anche numerosi"
	line "#MON."
	done

BattleTowerOutsideYoungsterText:
	text "Ehi, la TORRE"
	line "LOTTA è enorme!"

	para "Chissà quanti"
	line "#MON ci sono"
	cont "là dentro!"
	done

BattleTowerOutsideBeautyText_NotYetOpen: ; unreferenced
	text "Cosa diamine ci"
	line "fanno loro qui?"

	para "Se il nome non mi"
	line "inganna, credo che"

	para "cerchino lotte di"
	line "#MON."
	done

BattleTowerOutsideBeautyText:
	text "Puoi usare solo"
	line "tre #MON."

	para "Non è facile"
	line "decidere quali"

	para "utilizzare nella"
	line "lotta…"
	done

BattleTowerOutsideSailorText_Mobile: ; unreferenced
	text "Ehehehe…"
	line "Sono sgattaiolato"

	para "dal lavoro per"
	line "arrivare qui."

	para "Non mi arrenderò"
	line "fino a che non"
	
	para "divento un"
	line "CAPOSALA!"
	done

BattleTowerOutsideSailorText:
	text "Dovrei essere al"
	line "lavoro…"

	para "Ma non me ne vado"
	line "finché non vinco."

	para "Devo vincerle"
	line "tutte!"
	done

BattleTowerOutsideSignText_NotYetOpen: ; unreferenced
; originally shown when the Battle Tower was closed
	text "TORRE LOTTA"
	done

BattleTowerOutsideSignText:
	text "TORRE LOTTA"

	para "La grande sfida"
	line "tra Allenatori!"
	done

BattleTowerOutsideText_DoorsClosed: ; unreferenced
; originally shown when the Battle Tower was closed
	text "È aperta!"
	line "Non operativa."
	done

BattleTowerOutsideText_DoorsOpen: ; unreferenced
; originally shown after the Battle Tower opened
	text "È aperta!"
	done

BattleTowerOutside_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8, 21, ROUTE_40_BATTLE_TOWER_GATE, 3
	warp_event  9, 21, ROUTE_40_BATTLE_TOWER_GATE, 4
	warp_event  8,  9, BATTLE_TOWER_1F, 1
	warp_event  9,  9, BATTLE_TOWER_1F, 2

	def_coord_events

	def_bg_events
	bg_event 10, 10, BGEVENT_READ, BattleTowerOutsideSign
	bg_event  8,  9, BGEVENT_READ, BattleTowerOutsideDoor; 67e8f
	bg_event  9,  9, BGEVENT_READ, BattleTowerOutsideDoor

	def_object_events
	object_event  6, 12, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideYoungsterScript, -1
	object_event 13, 11, SPRITE_BEAUTY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideBeautyScript, -1
	object_event 12, 18, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideSailorScript, EVENT_BATTLE_TOWER_OPEN_CIVILIANS
	object_event 12, 24, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
