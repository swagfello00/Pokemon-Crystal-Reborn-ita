	object_const_def

Route41UnderwaterCave_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, DiveMap3

DiveMap3:
	divemap WHIRL_ISLAND_LUGIA_CHAMBER
	return

Route41UnderwaterCave_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 13, ROUTE_41_UNDERWATER, 1

	def_coord_events

	def_bg_events

	def_object_events
