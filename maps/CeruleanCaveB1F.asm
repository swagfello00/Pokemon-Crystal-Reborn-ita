	object_const_def
	const CERULEANCAVEB1F_MEWTWO
	const CERULEANCAVEB1F_POKE_BALL1
	const CERULEANCAVEB1F_POKE_BALL2

CeruleanCaveB1F_MapScripts:
	def_scene_scripts

	def_callbacks

MewtwoFight:
	loadmem wBuffer1, 0
	faceplayer
	opentext
	writetext SilverCaveOutsideMewtwoText
	pause 15
	cry MEWTWO
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_SUICUNE
	loadwildmon MEWTWO, 60
	startbattle
	disappear CERULEANCAVEB1F_MEWTWO
	reloadmapafterbattle
	readmem wBuffer1
	ifnotequal MEWTWO, .end
	setevent EVENT_CAUGHT_MEWTWO
.end
	end

CeruleanCaveB1FUltraBall:
	itemball ULTRA_BALL

CeruleanCaveB1FMaxElixir:
	itemball MAX_ELIXER

CeruleanCaveB1FHiddenMaxRevive:
	hiddenitem MAX_REVIVE, EVENT_CERULEAN_CAVE_B1F_HIDDEN_MAX_REVIVE

CeruleanCaveB1FHiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_CERULEAN_CAVE_B1F_HIDDEN_ULTRA_BALL

SilverCaveOutsideMewtwoText:
	text "Mew!"
	done

CeruleanCaveB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  7, CERULEAN_CAVE_1F, 5

	def_coord_events

	def_bg_events
	bg_event  8,  6, BGEVENT_ITEM, CeruleanCaveB1FHiddenMaxRevive
	bg_event 24, 11, BGEVENT_ITEM, CeruleanCaveB1FHiddenUltraBall

	def_object_events
	object_event  7, 13, SPRITE_MEWTWO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, MewtwoFight, EVENT_SILVER_CAVE_OUTSIDE_MEWTWO
	object_event 26,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCaveB1FUltraBall, EVENT_CERULEAN_CAVE_B1F_ULTRA_BALL
	object_event 26,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCaveB1FMaxElixir, EVENT_CERULEAN_CAVE_B1F_MAX_ELIXER