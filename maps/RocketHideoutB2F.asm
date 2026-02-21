RocketHideoutB2F_MapScripts:
	def_scene_scripts

	def_callbacks

RocketHideoutB2FUltraBall:
	itemball ULTRA_BALL

RocketHideoutB2FSuperRepel:
	itemball SUPER_REPEL

RocketHideoutB2FNugget:
	itemball NUGGET

RocketHideoutB2FRareCandy:
	itemball RARE_CANDY

RocketHideoutB2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 27,  2, ROCKET_HIDEOUT_B1F, 2
	warp_event 21,  2, ROCKET_HIDEOUT_B3F, 1
	warp_event 21, 16, ROCKET_HIDEOUT_B1F, 3
	warp_event 24, 13, ROCKET_HIDEOUT_ELEVATOR, 1
	warp_event 25, 13, ROCKET_HIDEOUT_ELEVATOR, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 16,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RocketHideoutB2FUltraBall, EVENT_ROCKET_HIDEOUT_B2F_ULTRA_BALL
	object_event  1,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RocketHideoutB2FSuperRepel, EVENT_ROCKET_HIDEOUT_B2F_SUPER_REPEL
	object_event  6,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RocketHideoutB2FNugget, EVENT_ROCKET_HIDEOUT_B2F_NUGGET
	object_event  3, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RocketHideoutB2FRareCandy, EVENT_ROCKET_HIDEOUT_B2F_RARE_CANDY