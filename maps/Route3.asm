	object_const_def
	const ROUTE3_FISHER1
	const ROUTE3_YOUNGSTER1
	const ROUTE3_YOUNGSTER2
	const ROUTE3_FISHER2
	const ROUTE3_POKEBALL1

Route3_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerFirebreatherOtis:
	trainer FIREBREATHER, OTIS, EVENT_BEAT_FIREBREATHER_OTIS, FirebreatherOtisSeenText, FirebreatherOtisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherOtisAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterWarren:
	trainer YOUNGSTER, WARREN, EVENT_BEAT_YOUNGSTER_WARREN, YoungsterWarrenSeenText, YoungsterWarrenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterWarrenAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterJimmy:
	trainer YOUNGSTER, JIMMY, EVENT_BEAT_YOUNGSTER_JIMMY, YoungsterJimmySeenText, YoungsterJimmyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterJimmyAfterBattleText
	waitbutton
	closetext
	end

TrainerFirebreatherBurt:
	trainer FIREBREATHER, BURT, EVENT_BEAT_FIREBREATHER_BURT, FirebreatherBurtSeenText, FirebreatherBurtBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherBurtAfterBattleText
	waitbutton
	closetext
	end

Route3MtMoonSquareSign:
	jumptext Route3MtMoonSquareSignText

Route3Stick:
	itemball STICK

Route3PokecenterSign:
	jumpstd PokecenterSignScript

FirebreatherOtisSeenText:
	text "Ah, il tempo è"
	line "bello come sempre."
	done

FirebreatherOtisBeatenText:
	text "Ma sono tutto"
	line "bagnato…"
	done

FirebreatherOtisAfterBattleText:
	text "Quando piove è"
	line "difficile partire…"
	done

YoungsterWarrenSeenText:
	text "Ehm… Non so che"
	line "fare…"
	done

YoungsterWarrenBeatenText:
	text "Sapevo che avrei"
	line "perso…"
	done

YoungsterWarrenAfterBattleText:
	text "Si vedeva che eri"
	line "forte."

	para "Avevo paura di"
	line "sfidarti…"
	done

YoungsterJimmySeenText:
	text "Sono veloce come"
	line "il vento!"
	done

YoungsterJimmyBeatenText:
	text "Spazzato via!"
	done

YoungsterJimmyAfterBattleText:
	text "Sono sempre in"
	line "pantaloncini."

	para "Fa parte del mio"
	line "look."
	done

FirebreatherBurtSeenText:
	text "Sali a dare"
	line "un'occhiata!"
	done

FirebreatherBurtBeatenText:
	text "Mitico!"
	done

FirebreatherBurtAfterBattleText:
	text "Sono il miglior"
	line "mangiafuoco di"
	cont "KANTO."

	para "Ma non il miglior"
	line "allenatore…"
	done

Route3MtMoonSquareSignText:
	text "PIAZZA MONTE LUNA"

	para "Si prega di salire"
	line "le scale."
	done

Route3_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 52,  3, MOUNT_MOON, 1
	warp_event 49,  5, ROUTE_3_POKECENTER_1F, 1

	def_coord_events

	def_bg_events
	bg_event 49, 15, BGEVENT_READ, Route3MtMoonSquareSign
	bg_event 50,  5, BGEVENT_READ, Route3PokecenterSign

	def_object_events
	object_event 26, 14, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerFirebreatherOtis, -1
	object_event 10,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterWarren, -1
	object_event 16,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerYoungsterJimmy, -1
	object_event 49,  8, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerFirebreatherBurt, -1
	object_event 26, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route3Stick, EVENT_ROUTE_3_STICK
