RocketHideoutB4F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, RocketHideoutB4FDoorsCallback

RocketHideoutB4FDoorsCallback:
	checkevent EVENT_ROCKET_HIDEOUT_DOORS_OPEN
	iftrue .end
	changeblock 16, 10, $6a
.end
	endcallback

RocketHideoutGeneratorScript:
	opentext
	writetext RocketHideoutGeneratorText
	waitbutton
	refreshscreen
	playsound SFX_ENTER_DOOR
	changeblock 16, 10, $0d
	reloadmappart
	setevent EVENT_ROCKET_HIDEOUT_DOORS_OPEN
	closetext
	end

RocketHideoutDoorsScript:
	conditional_event EVENT_ROCKET_HIDEOUT_DOORS_OPEN, .Script

.Script
	opentext
	writetext RocketHideoutDoorsText
	waitbutton
	closetext
	end

RocketHideoutB4FXSpecial:
	itemball X_SPECIAL
	
RocketHideoutB4FPPUp:
	itemball PP_UP
	
RocketHideoutB4FTM32:
	itemball TM_DOUBLE_TEAM

RocketHideoutB4FSilphScope:
	itemball SILPH_SCOPE

RocketHideoutB4FHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_ROCKET_HIDEOUT_B4F_HIDDEN_MAX_POTION

RocketHideoutDoorsText:
	text "Un generatore in"
	line "particolare deve"
	cont "aprire questa"
	cont "porta."
	done

RocketHideoutGeneratorText:
	text "Questo generatore"
	line "ha un pulsante,"
	
	para "Premiamolo!"
	done

RocketHideoutB4F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11, 10, ROCKET_HIDEOUT_B3F, 2
	warp_event 16, 15, ROCKET_HIDEOUT_ELEVATOR, 1
	warp_event 17, 15, ROCKET_HIDEOUT_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, RocketHideoutGeneratorScript
	bg_event 16, 11, BGEVENT_IFNOTSET, RocketHideoutDoorsScript
	bg_event 17, 11, BGEVENT_IFNOTSET, RocketHideoutDoorsScript
	bg_event 17,  1, BGEVENT_ITEM, RocketHideoutB4FHiddenMaxPotion

	def_object_events
	object_event  1,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RocketHideoutB4FXSpecial, EVENT_ROCKET_HIDEOUT_B4F_X_SPECIAL
	object_event  2, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RocketHideoutB4FPPUp, EVENT_ROCKET_HIDEOUT_B4F_PP_UP
	object_event  4, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RocketHideoutB4FTM32, EVENT_ROCKET_HIDEOUT_B4F_TM_DOUBLE_TEAM
	object_event 20,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RocketHideoutB4FSilphScope, EVENT_ROCKET_HIDEOUT_B4F_SILPH_SCOPE