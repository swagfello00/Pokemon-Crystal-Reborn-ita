	object_const_def
	const SEAFOAM_ISLANDS_B2F_POKE_BALL1

SeafoamIslandsB2F_MapScripts:
	def_scene_scripts

	def_callbacks

SeafoamIslandsB2FWaterStone:
	itemball WATER_STONE

SeafoamIslandsB2FHiddenPearl1:
	hiddenitem PEARL, EVENT_SEAFOAM_ISLANDS_B2F_HIDDEN_PEARL_1

SeafoamIslandsB2FHiddenPearl2:
	hiddenitem PEARL, EVENT_SEAFOAM_ISLANDS_B2F_HIDDEN_PEARL_2

SeafoamIslandsB2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15,  7, SEAFOAM_ISLANDS_B1F, 3
	warp_event 13, 13, SEAFOAM_ISLANDS_B1F, 4
	warp_event  7, 15, SEAFOAM_ISLANDS_B1F, 5
	warp_event 25, 15, SEAFOAM_ISLANDS_B1F, 6
	warp_event 35,  7, SEAFOAM_ISLANDS_B3F, 1
	warp_event 28,  9, SEAFOAM_ISLANDS_B3F, 2
	warp_event  4, 13, SEAFOAM_ISLANDS_B3F, 4
	warp_event 35, 15, SEAFOAM_ISLANDS_B3F, 3

	def_coord_events

	def_bg_events
	bg_event  7,  9, BGEVENT_ITEM, SeafoamIslandsB2FHiddenPearl1
	bg_event 35, 13, BGEVENT_ITEM, SeafoamIslandsB2FHiddenPearl2

	def_object_events
	object_event 15, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SeafoamIslandsB2FWaterStone, EVENT_SEAFOAM_ISLANDS_B2F_WATER_STONE