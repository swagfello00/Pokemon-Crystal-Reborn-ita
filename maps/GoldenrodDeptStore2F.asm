	object_const_def
	const GOLDENRODDEPTSTORE2F_CLERK1
	const GOLDENRODDEPTSTORE2F_CLERK2
	const GOLDENRODDEPTSTORE2F_YOUNGSTER
	const GOLDENRODDEPTSTORE2F_COOLTRAINER_F
	const GOLDENRODDEPTSTORE2F_GENTLEMAN

GoldenrodDeptStore2F_MapScripts:
	def_scene_scripts

	def_callbacks

GoldenrodDeptStore2FClerk1Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_2F_1
	closetext
	end

GoldenrodDeptStore2FClerk2Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_2F_2
	closetext
	end

GoldenrodDeptStore2FYoungsterScript:
	jumptextfaceplayer GoldenrodDeptStore2FYoungsterText

GoldenrodDeptStore2FCooltrainerFScript:
	jumptextfaceplayer GoldenrodDeptStore2FCooltrainerFText

GoldenrodDeptStore2FGentlemanScript:
	jumptextfaceplayer GoldenrodDeptStore2FGentlemanText

GoldenrodDeptStore2FDirectory:
	jumptext GoldenrodDeptStore2FDirectoryText

GoldenrodDeptStore2FElevatorButton:
	jumpstd ElevatorButtonScript

GoldenrodDeptStore2FUnusedText1: ; unreferenced
	text "Siamo specializza-"
	line "ti in strumenti da"
	cont "far tenere ai"
	cont "#MON."

	para "Eccoti un omaggio:"
	line "fallo tenere ad un"
	cont "#MON."
	done

GoldenrodDeptStore2FUnusedText2: ; unreferenced
	text "Se i tuoi #MON"
	line "tengono strumenti"
	cont "durante la lotta,"
	cont "puoi vincere più"
	cont "facilmente."
	done

GoldenrodDeptStore2FYoungsterText:
	text "Il #GEAR può"
	line "contenere 32"
	cont "numeri telefonici."

	para "Non è dura"
	line "decidere quali"
	cont "numeri tenere."
	done

GoldenrodDeptStore2FCooltrainerFText:
	text "Ho preso il mio"
	line "ABRA al CASINÒ."

	para "Ora è il mio"
	line "migliore amico."
	done

GoldenrodDeptStore2FGentlemanText:
	text "Al CENTRO COMMER-"
	line "CIALE si vede che"

	para "FIORDOROPOLI è"
	line "una grande città."

	para "Hanno una scelta"
	line "che altrove non"
	cont "esiste."
	done

GoldenrodDeptStore2FDirectoryText:
	text "Il tuo compagno"
	line "di viaggio"

	para "1ºP BANCO PER"
	line "    ALLENATORI"
	done

GoldenrodDeptStore2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 12,  0, GOLDENROD_DEPT_STORE_3F, 1
	warp_event 15,  0, GOLDENROD_DEPT_STORE_1F, 3
	warp_event  2,  0, GOLDENROD_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_READ, GoldenrodDeptStore2FDirectory
	bg_event  3,  0, BGEVENT_READ, GoldenrodDeptStore2FElevatorButton

	def_object_events
	object_event 13,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore2FClerk1Script, -1
	object_event 13,  6, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore2FClerk2Script, -1
	object_event  9,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore2FYoungsterScript, -1
	object_event  6,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore2FCooltrainerFScript, -1
	object_event  2,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore2FGentlemanScript, -1
