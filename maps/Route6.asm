	object_const_def
	const ROUTE6_POKEFAN_M1
	const ROUTE6_POKEFAN_M2
	const ROUTE6_POKEFAN_M3

Route6_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerPokefanmRex:
	trainer POKEFANM, REX, EVENT_BEAT_POKEFANM_REX, PokefanmRexSeenText, PokefanmRexBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmRexAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmAllan:
	trainer POKEFANM, ALLAN, EVENT_BEAT_POKEFANM_ALLAN, PokefanmAllanSeenText, PokefanmAllanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmAllanAfterBattleText
	waitbutton
	closetext
	end

Route6PokefanMScript:
	jumptextfaceplayer Route6PokefanMText

Route6UndergroundPathSign:
	jumptext Route6UndergroundPathSignText

Route6PokefanMText:
	text "La strada è chiusa"
	line "per l'incidente"

	para "alla CENTRALE"
	line "ELETTRICA."
	done

Route6UndergroundPathSignText:
	text "VIA SOTTERRANEA"

	para "CELESTOPOLI-"
	line "ARANCIOPOLI"
	done

PokefanmRexSeenText:
	text "Il mio DONPHAN è"
	line "il più dolce del"
	cont "mondo."
	done

PokefanmRexBeatenText:
	text "Oh, il mio"
	line "DONPHAN!"
	done

PokefanmRexAfterBattleText:
	text "Guarda com'è"
	line "dolce il mio"
	cont "DONPHAN!"

	para "A guardarlo ci"
	line "si sente più"
	cont "buoni!"
	done

PokefanmAllanSeenText:
	text "Il mio URSARING è"
	line "il più dolce del"
	cont "mondo."
	done

PokefanmAllanBeatenText:
	text "Il mio URSARING!"
	done

PokefanmAllanAfterBattleText:
	text "Guarda com'è"
	line "dolce il mio"
	cont "URSARING!"

	para "A guardarlo ci"
	line "si sente più"
	cont "buoni!"
	done

Route6_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17,  3, ROUTE_6_UNDERGROUND_PATH_ENTRANCE, 1
	warp_event  6,  1, ROUTE_6_SAFFRON_GATE, 3

	def_coord_events

	def_bg_events
	bg_event 19,  5, BGEVENT_READ, Route6UndergroundPathSign

	def_object_events
	object_event 17,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 2, Route6PokefanMScript, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	object_event  9, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerPokefanmRex, -1
	object_event 10, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerPokefanmAllan, -1
