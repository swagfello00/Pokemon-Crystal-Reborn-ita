	object_const_def
	const VERMILIONFISHINGSPEECHHOUSE_FISHING_GURU

VermilionFishingSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

FishingDude:
	jumptextfaceplayer FishingDudeText

FishingDudesHousePhoto:
	jumptext FishingDudesHousePhotoText

FishingDudesHouseBookshelf: ; unreferenced
	jumpstd PictureBookshelfScript

FishingDudeText:
	text "Sono il PESCATORE"
	line "GENTILE, il più"
	cont "vecchio dei FRA-"
	cont "TELLI PESCATORI."

	para "Hai visto il GURU"
	line "PESCATORE al LAGO"
	cont "D'IRA?"

	para "Sogna di vedere il"
	line "MAGIKARP più"
	cont "grande del mondo."

	para "Perché non gli"
	line "mostri uno dei"

	para "MAGIKARP che hai"
	line "catturato?"

	para "Chissà, magari"
	line "catturi il"
	cont "MAGIKARP dei suoi"
	cont "sogni!"
	done

FishingDudesHousePhotoText:
	text "Nella foto c'è"
	line "gente che pesca…"

	para "Sembra che si"
	line "divertano…"
	done

VermilionFishingSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, VERMILION_CITY, 1
	warp_event  3,  7, VERMILION_CITY, 1

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, FishingDudesHousePhoto

	def_object_events
	object_event  2,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FishingDude, -1
