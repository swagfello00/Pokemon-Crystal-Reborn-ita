	object_const_def
	const CERULEANCAVE2F_POKE_BALL1
	const CERULEANCAVE2F_POKE_BALL2
	const CERULEANCAVE2F_POKE_BALL3
	const CERULEANCAVE2F_POKE_BALL4

CeruleanCave2F_MapScripts:
	def_scene_scripts

	def_callbacks

CeruleanCave2FTM15:
	itemball TM_HYPER_BEAM

CeruleanCave2FUltraBall:
	itemball ULTRA_BALL

CeruleanCave2FFullRestore:
	itemball FULL_RESTORE

CeruleanCave2FPPup:
	itemball PP_UP

CeruleanCave2FHiddenNugget:
	hiddenitem NUGGET, EVENT_CERULEAN_CAVE_2F_HIDDEN_NUGGET

CeruleanCave2FHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_CERULEAN_CAVE_2F_HIDDEN_HYPER_POTION

CeruleanCave2FHiddenProtein:
	hiddenitem PROTEIN, EVENT_CERULEAN_CAVE_2F_HIDDEN_PROTEIN

CeruleanCave2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11,  3, CERULEAN_CAVE_1F, 2
	warp_event 31,  3, CERULEAN_CAVE_1F, 3
	warp_event  3,  5, CERULEAN_CAVE_1F, 4
	warp_event 24,  8, CERULEAN_CAVE_1F, 6
	warp_event 21,  9, CERULEAN_CAVE_1F, 7
	warp_event  5, 13, CERULEAN_CAVE_1F, 8

	def_coord_events

	def_bg_events
	bg_event 16,  4, BGEVENT_ITEM, CeruleanCave2FHiddenNugget
	bg_event 13, 17, BGEVENT_ITEM, CeruleanCave2FHiddenHyperPotion
	bg_event 17, 19, BGEVENT_ITEM, CeruleanCave2FHiddenProtein

	def_object_events
	object_event  2,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave2FTM15, EVENT_CERULEAN_CAVE_2F_TM_HYPER_BEAM
	object_event 27, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave2FUltraBall, EVENT_CERULEAN_CAVE_2F_ULTRA_BALL
	object_event 31, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave2FFullRestore, EVENT_CERULEAN_CAVE_2F_FULL_RESTORE
	object_event  7, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave2FPPup, EVENT_CERULEAN_CAVE_2F_PP_UP