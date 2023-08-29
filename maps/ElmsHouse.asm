	object_const_def
	const ELMSHOUSE_ELMS_WIFE
	const ELMSHOUSE_ELMS_SON

ElmsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

ElmsWife:
	jumptextfaceplayer ElmsWifeText

ElmsSon:
	jumptextfaceplayer ElmsSonText

ElmsHousePC:
	jumptext ElmsHousePCText

ElmsHouseBookshelf:
	jumpstd DifficultBookshelfScript

ElmsWifeText:
	text "Ciao, <PLAY_G>! Mio"
	line "marito è sempre"

	para "impegnatissimo:"
	line "spero stia bene."

	para "Quando è nelle sue"
	line "ricerche #MON,"

	para "dimentica persino"
	line "di mangiare."
	done

ElmsSonText:
	text "Quando sarò"
	line "grande aiuterò il"
	cont "mio papà!"

	para "Diventerò un"
	line "famoso professore"
	cont "#MON!"
	done

ElmsHouseLabFoodText: ; unreferenced
	text "Del cibo:"
	line "dev'essere per il"
	cont "LABORATORIO."
	done

ElmsHousePokemonFoodText: ; unreferenced
	text "Del cibo:"
	line "dev'essere per i"
	cont "#MON."
	done

ElmsHousePCText:
	text "I #MON: da"
	line "dove vengono?"

	para "Dove sono"
	line "diretti?"

	para "Perché nessuno"
	line "li ha ancora visti"
	cont "nascere?"

	para "Devo saperlo!"
	line "Dedicherò la mia"

	para "vita allo studio"
	line "dei #MON!"

	para "…"

	para "Sono gli appunti"
	line "del PROF.ELM."
	done

ElmsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, NEW_BARK_TOWN, 4
	warp_event  3,  7, NEW_BARK_TOWN, 4

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, ElmsHousePC
	bg_event  6,  1, BGEVENT_READ, ElmsHouseBookshelf
	bg_event  7,  1, BGEVENT_READ, ElmsHouseBookshelf

	def_object_events
	object_event  1,  5, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ElmsWife, -1
	object_event  5,  4, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ElmsSon, -1
