	object_const_def
	const ROUTE40BATTLETOWERGATE_ROCKER
	const ROUTE40BATTLETOWERGATE_TWIN

Route40BattleTowerGate_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, RouteBattleTowerGateShowSailorCallback

RouteBattleTowerGateShowSailorCallback:
	special Mobile_DummyReturnFalse
	iffalse .nomobile
	clearevent EVENT_BATTLE_TOWER_OPEN_CIVILIANS

.nomobile
	return

Route40BattleTowerGateRockerScript:
	jumptextfaceplayer Route40BattleTowerGateUnusedText3

Route40BattleTowerGateTwinScript:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer Route40BattleTowerGateUnusedText1

.mobile
	jumptextfaceplayer Route40BattleTowerGateUnusedText2

Route40BattleTowerGateUnusedText1:
	text "Sei venuto a"
	line "visitare la TORRE"
	cont "LOTTA anche tu?"

	para "Credo che sia"
	line "ancora chiusa."
	done

Route40BattleTowerGateUnusedText2:
	text "La TORRE LOTTA è"
	line "aperta."

	para "Vorrei andarci ma"
	line "non ho ancora"

	para "imparato un buon"
	line "motto per quando"
	cont "ho una vittoria."
	done

Route40BattleTowerGateRockerText:
	text "Stai andando alla"
	line "TORRE LOTTA?"

	para "Non dirlo in giro,"
	line "ma se vinci molte"

	para "lotte ricevi"
	line "regali speciali."
	done

Route40BattleTowerGateUnusedText3:
	text "Allenerò i miei"
	line "#MON così sarò"

	para "pronto per la"
	line "TORRE LOTTA."
	done

Route40BattleTowerGateTwinText:
	text "I #MON che"
	line "voglio usare hanno"

	para "tutti livelli"
	line "diversi."

	para "Quindi, prima devo"
	line "allenarli!"
	done

Route40BattleTowerGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, ROUTE_40, 1
	warp_event  5,  7, ROUTE_40, 1
	warp_event  4,  0, BATTLE_TOWER_OUTSIDE, 1
	warp_event  5,  0, BATTLE_TOWER_OUTSIDE, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  3, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route40BattleTowerGateRockerScript, EVENT_BATTLE_TOWER_OPEN_CIVILIANS
	object_event  7,  5, SPRITE_TWIN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route40BattleTowerGateTwinScript, -1
