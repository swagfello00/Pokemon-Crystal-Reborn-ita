RocketHideoutB1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, RocketHideoutB1FDoorsCallback

RocketHideoutB1FDoorsCallback:
	checkevent EVENT_ROCKET_HIDEOUT_DOORS_OPEN
	iftrue .end
	changeblock 16, 16, $5f
.end
	endcallback

RocketHideoutB1FCalcium:
	itemball CALCIUM

RocketHideoutB1FMoonStone:
	itemball MOON_STONE

RocketHideoutB1FHiddenMaxRevive:
	hiddenitem MAX_REVIVE, EVENT_ROCKET_HIDEOUT_B1F_HIDDEN_MAX_REVIVE

RocketHideoutB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13,  2, CELADON_GAME_CORNER, 3
	warp_event 15,  2, ROCKET_HIDEOUT_B2F, 1
	warp_event 13, 24, ROCKET_HIDEOUT_B2F, 3
	warp_event 16, 19, ROCKET_HIDEOUT_ELEVATOR, 1
	warp_event 17, 19, ROCKET_HIDEOUT_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 16, 16, BGEVENT_IFNOTSET, RocketHideoutDoorsScript
	bg_event 17, 16, BGEVENT_IFNOTSET, RocketHideoutDoorsScript
	bg_event 13, 15, BGEVENT_ITEM, RocketHideoutB1FHiddenMaxRevive

	def_object_events
	object_event  3, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RocketHideoutB1FCalcium, EVENT_ROCKET_HIDEOUT_B1F_CALCIUM
	object_event  1, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RocketHideoutB1FMoonStone, EVENT_ROCKET_HIDEOUT_B1F_MOON_STONE