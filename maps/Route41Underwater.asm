	object_const_def
	const ROUTE41UNDERWATER_POKE_BALL1
	const ROUTE41UNDERWATER_POKE_BALL2

Route41Underwater_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, DiveMap

DiveMap:
	divemap ROUTE_41
	return

Route41UnderwaterPearl:
	itemball PEARL

Route41UnderwaterBigPearl:
	itemball BIG_PEARL

Route41Underwater_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  17, 1, ROUTE_41_UNDERWATER_CAVE, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 25, 29, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route41UnderwaterPearl, EVENT_ROUTE_41_UNDERWATER_PEARL
	object_event 19,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route41UnderwaterBigPearl, EVENT_ROUTE_41_UNDERWATER_BIG_PEARL
