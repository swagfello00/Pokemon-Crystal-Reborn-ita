	object_const_def
	const CERULEANCAVE1F_POKE_BALL1
	const CERULEANCAVE1F_POKE_BALL2
	const CERULEANCAVE1F_POKE_BALL3

CeruleanCave1F_MapScripts:
	def_scene_scripts

	def_callbacks

CeruleanCave1FMaxRevive:
	itemball MAX_REVIVE

CeruleanCave1FNugget:
	itemball NUGGET

CeruleanCave1FFullRestore:
	itemball FULL_RESTORE

CeruleanCave1FHiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_CERULEAN_CAVE_1F_HIDDEN_ULTRA_BALL

CeruleanCave1FHiddenPPUp:
	hiddenitem PP_UP, EVENT_CERULEAN_CAVE_1F_HIDDEN_PP_UP

CeruleanCave1FHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_CERULEAN_CAVE_1F_HIDDEN_RARE_CANDY

CeruleanCave1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 27, 19, CERULEAN_CITY, 7
	warp_event  9,  3, CERULEAN_CAVE_2F, 1
	warp_event 29,  3, CERULEAN_CAVE_2F, 2
	warp_event  3,  5, CERULEAN_CAVE_2F, 3
	warp_event  2,  8, CERULEAN_CAVE_B1F, 1
	warp_event 25,  9, CERULEAN_CAVE_2F, 4
	warp_event 20, 11, CERULEAN_CAVE_2F, 5
	warp_event  5, 13, CERULEAN_CAVE_2F, 6

	def_coord_events

	def_bg_events
	bg_event 10, 11, BGEVENT_ITEM, CeruleanCave1FHiddenUltraBall
	bg_event  5, 14, BGEVENT_ITEM, CeruleanCave1FHiddenPPUp
	bg_event 16, 13, BGEVENT_ITEM, CeruleanCave1FHiddenRareCandy

	def_object_events
	object_event 21,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave1FMaxRevive, EVENT_CERULEAN_CAVE_1F_MAX_REVIVE
	object_event  7,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave1FNugget, EVENT_CERULEAN_CAVE_1F_NUGGET
	object_event  9, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave1FFullRestore, EVENT_CERULEAN_CAVE_1F_FULL_RESTORE
