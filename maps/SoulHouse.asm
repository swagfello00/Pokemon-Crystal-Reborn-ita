	object_const_def
	const SOULHOUSE_MRFUJI
	const SOULHOUSE_TEACHER
	const SOULHOUSE_LASS
	const SOULHOUSE_GRANNY

SoulHouse_MapScripts:
	def_scene_scripts

	def_callbacks

MrFuji:
	jumptextfaceplayer MrFujiText

SoulHouseTeacherScript:
	jumptextfaceplayer SoulHouseTeacherText

SoulHouseLassScript:
	jumptextfaceplayer SoulHouseLassText

SoulHouseGrannyScript:
	jumptextfaceplayer SoulHouseGrannyText

MrFujiText:
	text "MR.FUJI: Ti do il"
	line "benvenuto!"

	para "Bene… Vedo che"
	line "stai allenando i"

	para "#MON con amore"
	line "e responsabilità."

	para "Qui si viene per"
	line "onorare le anime"

	para "dei #MON"
	line "scomparsi."

	para "Vuoi rendere omag-"
	line "gio anche tu alle"

	para "anime dei #MON"
	line "scomparsi?"

	para "Ne saranno"
	line "senz'altro felici."
	done

SoulHouseTeacherText:
	text "Qui ci sono altre"
	line "tombe di #MON,"
	cont "credo."

	para "Ci sono stanze in"
	line "cui solo MR.FUJI"
	cont "può entrare."
	done

SoulHouseLassText:
	text "Io e la mamma"
	line "visitiamo le tombe"
	cont "dei #MON…"
	done

SoulHouseGrannyText:
	text "I #MON con cui"
	line "ho vissuto erano"

	para "come dei nipotini"
	line "per me…"
	done

SoulHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, LAVENDER_TOWN, 6
	warp_event  5,  7, LAVENDER_TOWN, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MrFuji, -1
	object_event  7,  3, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SoulHouseTeacherScript, -1
	object_event  2,  5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SoulHouseLassScript, -1
	object_event  1,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SoulHouseGrannyScript, -1
