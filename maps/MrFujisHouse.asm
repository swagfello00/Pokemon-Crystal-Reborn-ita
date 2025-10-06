	object_const_def
	const MRFUJISHOUSE_SUPER_NERD
	const MRFUJISHOUSE_LASS
	const MRFUJISHOUSE_PSYDUCK
	const MRFUJISHOUSE_NIDORINO
	const MRFUJISHOUSE_PIDGEY

MrFujisHouse_MapScripts:
	def_scene_scripts

	def_callbacks

MrFujisHouseSuperNerdScript:
	jumptextfaceplayer MrFujisHouseSuperNerdText

MrFujisHouseLassScript:
	jumptextfaceplayer MrFujisHouseLassText

MrFujisPsyduck:
	opentext
	writetext MrFujisPsyduckText
	cry PSYDUCK
	waitbutton
	closetext
	end

MrFujisNidorino:
	opentext
	writetext MrFujisNidorinoText
	cry NIDORINO
	waitbutton
	closetext
	end

MrFujisPidgey:
	opentext
	writetext MrFujisPidgeyText
	cry PIDGEY
	waitbutton
	closetext
	end

MrFujisHouseBookshelf:
	jumpstd DifficultBookshelfScript

MrFujisHouseSuperNerdText:
	text "MR.FUJI vive qui,"
	line "ma non è a casa al"

	para "momento."

	para "Credo che sia alla"
	line "CASA dell'ANIMA."
	done

MrFujisHouseLassText:
	text "Ci sono persone"
	line "senza cuore che"
	cont "abbandonano i"
	cont "#MON."

	para "Il nonno si prende"
	line "cura dei"

	para "#MON rimasti"
	line "senza famiglia."
	done

MrFujisPsyduckText:
	text "PSYDUCK: Gu-gua?"
	done

MrFujisNidorinoText:
	text "NIDORINO: Niun!"
	done

MrFujisPidgeyText:
	text "PIDGEY: Piii!"
	done

MrFujisHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, LAVENDER_TOWN, 2
	warp_event  3,  7, LAVENDER_TOWN, 2

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, MrFujisHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, MrFujisHouseBookshelf

	def_object_events
	object_event  4,  1, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MrFujisHouseSuperNerdScript, -1
	object_event  3,  4, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MrFujisHouseLassScript, -1
	object_event  7,  4, SPRITE_PSYDUCK, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MrFujisPsyduck, -1
	object_event  5,  5, SPRITE_NIDORINO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, MrFujisNidorino, -1
	object_event  1,  3, SPRITE_PIDGEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MrFujisPidgey, -1
