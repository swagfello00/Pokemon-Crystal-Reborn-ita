	object_const_def
	const CELADONDEPTSTORE5F_CLERK1
	const CELADONDEPTSTORE5F_CLERK2
	const CELADONDEPTSTORE5F_GENTLEMAN
	const CELADONDEPTSTORE5F_SAILOR
	const CELADONDEPTSTORE5F_TEACHER

CeladonDeptStore5F_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonDeptStore5FClerk1Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_CELADON_5F_1
	closetext
	end

CeladonDeptStore5FClerk2Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_CELADON_5F_2
	closetext
	end

CeladonDeptStore5FGentlemanScript:
	jumptextfaceplayer CeladonDeptStore5FGentlemanText

CeladonDeptStore5FSailorScript:
	jumptextfaceplayer CeladonDeptStore5FSailorText

CeladonDeptStore5FTeacherScript:
	jumptextfaceplayer CeladonDeptStore5FTeacherText

CeladonDeptStore5FDirectory:
	jumptext CeladonDeptStore5FDirectoryText

CeladonDeptStore5FElevatorButton:
	jumpstd ElevatorButtonScript

CeladonDeptStore5FGentlemanText:
	text "Vorrei comprare"
	line "strumenti per"

	para "migliorare le"
	line "statistiche"
	cont "dei #MON, ma"
	cont "non ho abbastanza"
	cont "soldi…"
	done

CeladonDeptStore5FSailorText:
	text "Vorrei PP-SU per"
	line "poter aumentare i"
  cont "PP delle mosse:"
  
  para "aspetta…"
  line "ora lo vendono."
	done

CeladonDeptStore5FTeacherText:
	text "Ai #MON"
	line "piacciono gli"
	cont "strumenti."

	para "Ma ce ne sono"
	line "alcuni che odiano…"
	done

CeladonDeptStore5FDirectoryText:
	text "4ºP: FARMACIA"
	done

CeladonDeptStore5F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 12,  0, CELADON_DEPT_STORE_4F, 1
	warp_event 15,  0, CELADON_DEPT_STORE_6F, 1
	warp_event  2,  0, CELADON_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_READ, CeladonDeptStore5FDirectory
	bg_event  3,  0, BGEVENT_READ, CeladonDeptStore5FElevatorButton

	def_object_events
	object_event  7,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore5FClerk1Script, -1
	object_event  8,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore5FClerk2Script, -1
	object_event 13,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore5FGentlemanScript, -1
	object_event  3,  4, SPRITE_SAILOR, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore5FSailorScript, -1
	object_event  1,  7, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore5FTeacherScript, -1
