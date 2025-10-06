RocketHideoutB3F_MapScripts:
	def_scene_scripts

	def_callbacks

RocketHideoutB3FCarbos:
	itemball CARBOS

RocketHideoutB3FElixer:
	itemball ELIXER

RocketHideoutB3FHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_ROCKET_HIDEOUT_B3F_HIDDEN_FULL_HEAL

RocketHideoutB3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17,  2, ROCKET_HIDEOUT_B2F, 2
	warp_event 11, 14, ROCKET_HIDEOUT_B4F, 1

	def_coord_events

	def_bg_events
	bg_event 19, 13, BGEVENT_ITEM, RocketHideoutB3FHiddenFullHeal

	def_object_events
	object_event 12, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RocketHideoutB3FCarbos, EVENT_ROCKET_HIDEOUT_B3F_CARBOS
	object_event 18, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RocketHideoutB3FElixer, EVENT_ROCKET_HIDEOUT_B3F_ELIXER